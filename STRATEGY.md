# Keyword Retry Listener

## KW in Test Case / Keyword Body

Workflow:

- start_keyword: if kw has retry tag -> register kw in internal list with metadata
- end_keyword: if kw failed & kw registered for retry -> append kw to parent body object (test / keyword)

--> keyword will be retried automatically as it is the next item in the parent test / keyword body.

## KW in Setup / Teardown (Suite / Test)

Issues:

- Suite setup: parent object of executed & failed keyword doesnt have a body object.
- Generic setup / teardown issue: those types are not part of the test / kw body - retry keyword cannot be appended to list

Solutions:
- suite setup: ???
- suite teardown: ???
- test setup: do we want to retry the complete test ?
- test teardown: ???

Or do we want to call the ``run_keyword`` function from the listener to directly retry the failed keywords ? If yes, must be different handling than keywords called directly from the test / kw body...