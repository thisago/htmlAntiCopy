<!--
  Created at: 09/02/2021 20:19:50 Thursday
  Modified at: 09/02/2021 08:40:58 PM Thursday

        Copyright (C) 2021 Thiago Navarro
  See file "license" for details about copyright
-->

# htmlAntiCopy

This simple lib prevents the copy of html text by joining a lot of chars randomly.

The user don't see these chars because it is hidden with CSS

In HTML, the chars has no difference between others, so you can't copy the
original text even on html.

## Usage

You need to install the [Nim](https://nim-lang.org) in your system to follow
this steps

### In web

```bash
# Clone this repo
git clone https://github.com/thisago/htmlAntiCopy

# Go to project dir
cd htmlAntiCopy/

# Compile to Javascript
nimble buildjs
```
Done, now your javascript is in `build/` directory.

The lib usage is simple:
```js
const html = antiCopy("Hello World!")
```
The second parameter is the shuffle level, higher level generates more random chars

## How it works

The lib randomly inserts random chars in text and save it position, the
positions is used to generate a CSS code that set the font to 0 the char.

The text container has a random class name.

The tag `<i>` was used because using `<span>` for every char makes the html
larger.

Example of output:
```html
<style>
  div.abc i:nth-child(2) {
    font-size: 0;
  }
</style>
<div class="abc">
  <i>H</i>
  <i>l</i>
  <i>i</i>
</div>
```

## Example

An example can be found in [`example/`](./example) folder.

## TODO

- [ ] Use `cstring` for all `string`s

## Licence

MIT
