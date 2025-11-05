*** Variables ***
${counter_01: int} =    0
${counter_02: int} =    0


*** Test Cases ***
Test 1 - PASS
    [Tags]    test:retry(0)
    Successful Keyword

Test 2 - Failed - Pass on 2. Retry
    [Tags]    test:retry(0)
    Error - Pass on Retry    2

Test 3 - Failed Child Keyword - Passed on Multiple Retries
    [Tags]    test:retry(0)
    VAR    ${counter_01} =    ${0}    scope=suite

    Test 3 - Failed Child Keyword

Test 4 - Failed - Retry Test & Keywords
    [Tags]    test:retry(4)
    
    Test 4 - Failed Child Keyword


*** Keywords ***
Successful Keyword
    [Tags]    keyword:retry(2)
    Log    Successful

Error - Pass on Retry
    [Arguments]    ${successful_retry: int}
    [Tags]    keyword:retry(2)
    ${counter_01} =    Evaluate    $counter_01 + 1
    VAR    ${counter_01} =    ${counter_01}    scope=SUITE
    Should Be Equal    ${counter_01}    ${successful_retry}

Test 3 - Failed Child Keyword
    [Tags]    keyword:retry(3)

    Error - Pass on Retry    5

Test 4 - Failed Child Keyword
    [Tags]    keyword:retry(2)

    Test 4 Child Keyword    10

Test 4 Child Keyword
    [Arguments]    ${successful_retry: int}
    [Tags]    keyword:retry(2)
    ${counter_02} =    Evaluate    $counter_02 + 1
    VAR    ${counter_02} =    ${counter_02}    scope=SUITE
    Should Be Equal    ${counter_02}    ${successful_retry}
    

    

