# html-xpaths

A JavaScript DSL to generate XPaths for matching HTML elements, using [xpath-builder](https://github.com/featurist/xpath-builder)

[![Build Status](https://secure.travis-ci.org/featurist/html-xpaths.png?branch=master)](http://travis-ci.org/featurist/html-xpaths)

html-xpaths is a port of the [html](https://github.com/jnicklas/xpath/blob/master/lib/xpath/html.rb) part of the [xpath](https://github.com/jnicklas/xpath) Ruby gem.


## Usage

```js
var html = require('html-xpaths').dsl();
```

## XPaths for HTML elements

#### .link(locator)
```js
html.link('foo')
```

```
.//a[./@href][(((./@id = 'foo' or contains(normalize-space(string(.)), 'foo')) or contains(./@title, 'foo')) or .//img[contains(./@alt, 'foo')])]
```

#### .button(locator)
```js
html.button('foo')
```

```
.//input[./@type = 'submit' or ./@type = 'reset' or ./@type = 'image' or ./@type = 'button'][((./@id = 'foo' or contains(./@value, 'foo')) or contains(./@title, 'foo'))] | .//button[(((./@id = 'foo' or contains(./@value, 'foo')) or contains(normalize-space(string(.)), 'foo')) or contains(./@title, 'foo'))] | .//input[./@type = 'image'][contains(./@alt, 'foo')]
```

#### .linkOrButton(locator)
```js
html.linkOrButton('foo')
```

```
.//a[./@href][(((./@id = 'foo' or contains(normalize-space(string(.)), 'foo')) or contains(./@title, 'foo')) or .//img[contains(./@alt, 'foo')])] | .//input[./@type = 'submit' or ./@type = 'reset' or ./@type = 'image' or ./@type = 'button'][((./@id = 'foo' or contains(./@value, 'foo')) or contains(./@title, 'foo'))] | .//button[(((./@id = 'foo' or contains(./@value, 'foo')) or contains(normalize-space(string(.)), 'foo')) or contains(./@title, 'foo'))] | .//input[./@type = 'image'][contains(./@alt, 'foo')]
```

#### .fieldset(locator)
```js
html.fieldset('foo')
```

```
.//fieldset[(./@id = 'foo' or ./legend[contains(normalize-space(string(.)), 'foo')])]
```

#### .field(locator)
```js
html.field('foo')
```

```
.//*[self::input | self::textarea | self::select][not(./@type = 'submit' or ./@type = 'image' or ./@type = 'hidden')][(((./@id = 'foo' or ./@name = 'foo') or ./@placeholder = 'foo') or ./@id = //label[contains(normalize-space(string(.)), 'foo')]/@for)] | .//label[contains(normalize-space(string(.)), 'foo')]//.//*[self::input | self::textarea | self::select][not(./@type = 'submit' or ./@type = 'image' or ./@type = 'hidden')]
```

#### .fillableField(locator)
```js
html.fillableField('foo')
```

```
.//*[self::input | self::textarea][not(./@type = 'submit' or ./@type = 'image' or ./@type = 'radio' or ./@type = 'checkbox' or ./@type = 'hidden' or ./@type = 'file')][(((./@id = 'foo' or ./@name = 'foo') or ./@placeholder = 'foo') or ./@id = //label[contains(normalize-space(string(.)), 'foo')]/@for)] | .//label[contains(normalize-space(string(.)), 'foo')]//.//*[self::input | self::textarea][not(./@type = 'submit' or ./@type = 'image' or ./@type = 'radio' or ./@type = 'checkbox' or ./@type = 'hidden' or ./@type = 'file')]
```

#### .select(locator)
```js
html.select('foo')
```

```
.//select[(((./@id = 'foo' or ./@name = 'foo') or ./@placeholder = 'foo') or ./@id = //label[contains(normalize-space(string(.)), 'foo')]/@for)] | .//label[contains(normalize-space(string(.)), 'foo')]//.//select
```

#### .checkbox(locator)
```js
html.checkbox('foo')
```

```
.//input[./@type = 'checkbox'][(((./@id = 'foo' or ./@name = 'foo') or ./@placeholder = 'foo') or ./@id = //label[contains(normalize-space(string(.)), 'foo')]/@for)] | .//label[contains(normalize-space(string(.)), 'foo')]//.//input[./@type = 'checkbox']
```

#### .radioButton(locator)
```js
html.radioButton('foo')
```

```
.//input[./@type = 'radio'][(((./@id = 'foo' or ./@name = 'foo') or ./@placeholder = 'foo') or ./@id = //label[contains(normalize-space(string(.)), 'foo')]/@for)] | .//label[contains(normalize-space(string(.)), 'foo')]//.//input[./@type = 'radio']
```

#### .fileField(locator)
```js
html.fileField('foo')
```

```
.//input[./@type = 'file'][(((./@id = 'foo' or ./@name = 'foo') or ./@placeholder = 'foo') or ./@id = //label[contains(normalize-space(string(.)), 'foo')]/@for)] | .//label[contains(normalize-space(string(.)), 'foo')]//.//input[./@type = 'file']
```

#### .optgroup(locator)
```js
html.optgroup('foo')
```

```
.//optgroup[contains(./@label, 'foo')]
```

#### .option(locator)
```js
html.option('foo')
```

```
.//option[contains(normalize-space(string(.)), 'foo')]
```

#### .table(locator)
```js
html.table('foo')
```

```
.//table[(./@id = 'foo' or contains(.//caption, 'foo'))]
```

#### .definitionDescription(locator)
```js
html.definitionDescription('foo')
```

```
.//dd[(./@id = 'foo' or ./preceding-sibling::*[1]/self::dt[normalize-space(string(.)) = 'foo'])]
```


## License

(The MIT License)

Copyright © 2013 Josh Chisholm

Copyright © 2010 Jonas Nicklas

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the ‘Software’), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.