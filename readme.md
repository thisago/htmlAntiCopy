# htmlAntiCopy

This simple lib prevents the copy of html text by joining a lot of chars randomly.

The user don't see these chars because it is hidden with CSS

In HTML, the chars has no difference between others, so you can't copy the
original text even on html.

Currently this lib has just an example using Javascript, but the correct is the
server generate the scrambled text.

In Nim, is possible to use same algorithm in both sides!

Later an server example will be added!

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

Or online, in [GH pages](https://thisago.github.io/htmlAntiCopy/example/)

## TODO

- [ ] Use `cstring` for all `string`s
- [ ] Another anti copy method that all html is fake text and the real is on css pseudo elements. This will allow you choose the fake text
- [ ] Add docs
- [ ] Add tests

## Licence

MIT
