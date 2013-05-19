BJEDebugServerLumberLogger
==========================

A CocoaLumberJack Logger which logs messages to [debugserver](http://rubygems.org/gems/debugserver).

View your debug logs in iTerm or Terminal.app and get out of that noisy, hard-to-read, xcode console.


## Usage

### Install with CocoaPods
```ruby
  pod 'BJEDebugServerLumberLogger'
```

### Configure CocoaLumberJack
```objective-c
#import "BJEDebugServerLumberLogger.h"

//stuff

  [DDLog addLogger:[[BJEDebugServerLumberLogger alloc] init]];
```

### Install debugserver

```bash
$ gem install debugserver
```

### Start debugserver
```bash
$ debugserver

Starting debug server on localhost:9000...
```

### Run!
![Screenshot](https://github.com/brendanjerwin/BJEDebugServerLumberLogger/raw/master/screen_shot.png "Screenshot")

## Thanks

This is really inspired and informed by [REDebugClient](https://github.com/romaonthego/REDebugClient).


## The MIT License (MIT)

Copyright (c) 2013 Brendan Erwin and contributers.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
