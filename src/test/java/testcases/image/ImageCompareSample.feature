Feature:

  Scenario:
    * robot { highlight: true, highlightDuration: 500 }
    * karate.fork('explorer.exe')
    * delay(3000)
    * window('File Explorer')
    * robot.input(Key.ALT + Key.F4)
    * delay(3000)
    * karate.fork('notepad')
    * delay(3000)
    * print robot.allWindows
    * window('^- Notepad')
    * def current = locate('Text Editor').screenshot()
    * def file = karate.write(current, "current.png")
    * print 'screenshot saved to:', file
    * compareImage { baseline: 'this:baseline.png', latest: '#(current)', options: {allowScaling: true, failureThreshold: 5.0}}
    * click('classpath:/resources/config/h1.png')