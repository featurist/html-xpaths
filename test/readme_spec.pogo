xpaths = require '../js/html'
HTML = xpaths.HTML
html = xpaths.dsl()
fs = require 'fs'

describe 'README.md'

    it 'includes an example for each html method'
        expected examples = examples markdown()
        readme md = fs.read file("#(__dirname)/../README.md") ^!.to string()
        if (readme md.index of (expected examples) == -1)
            throw (@new Error "README.md should contain the following text:\n\n#(expected examples)\n\n")

examples markdown () =
    Object.keys(HTML.prototype).map (example for).join("\n")

example for (method) =
    example = []
    if (method == 'locateField') @{ return [] }
    param names = param names in (html.(method))
    params = param names.map (@(name) @{ "'foo'" })
    js = "html.#(method)(#(params.join(', ')))"
    [
        "#### .#(method)(#(param names))"
        "```js"
        js
        "```"
        ""
        "```"
        eval(js).to string()
        "```"
        ""
    ].join("\n")

param names in (func) =
    s = func.toString().replace(r/((\/\/.*$)|(\/\*[\s\S]*?\*\/))/mg, '')
    s.slice(s.indexOf('(')+1, s.indexOf(')')).match(r/([^\s,]+)/g) || []
