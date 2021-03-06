save_options = ->
  console.log("save_options")
  for i in [1..10]
    if document.getElementById('url'+i).value != ""
      set(i)
    else
      reset(i)

  for i in [1..5]
    if document.getElementById('aws'+i).value != ""
      awsSet(i)
    else
      awsReset(i)

  document.getElementById('status').innerHTML = 'Options Saved.'
  setTimeout (->
    document.getElementById('status').innerHTML = ''
    return
  ), 1000
  return

restore_options = ->
  console.log("restore_options")
  for i in [1..10]
    get(i)
  for i in [1..5]
    awsGet(i)

  return

window.onload = ->
  restore_options()

  document.getElementById('save').onclick = ->
    save_options()
    return

  return

awsSet = (num) ->
  console.log("set " + num)
  data = {}
  data['aws'+num] = document.getElementById('aws'+num).value
  data['awscolor'+num] = document.getElementById('awscolor'+num).value
  data['awsbackground'+num] = document.getElementById('awsbackground'+num).value
  chrome.storage.sync.set(data)

awsGet = (num) ->
  console.log("get " + num)
  chrome.storage.sync.get(['aws'+num, 'awscolor'+num, 'awsbackground'+num], (items) ->
    if !items['aws'+num]
      return
    document.getElementById('aws'+num).value = items['aws'+num]
    document.getElementById('awscolor'+num).value = items['awscolor'+num]
    if items['awsbackground'+num]
      document.getElementById('awsbackground'+num).value = items['awsbackground'+num]
  )

awsReset = (num) ->
  console.log("awsreset " + num)
  data = {}
  data['aws'+num] = ""
  data['awscolor'+num] = ""
  data['awsbackground'+num] = ""
  chrome.storage.sync.set(data)

set = (num) ->
  console.log("set " + num)
  data = {}
  data['url'+num] = document.getElementById('url'+num).value
  data['color'+num] = document.getElementById('color'+num).value
  data['message'+num] = document.getElementById('message'+num).value
  chrome.storage.sync.set(data)

get = (num) ->
  console.log("get " + num)
  chrome.storage.sync.get(['url'+num, 'color'+num, 'message'+num], (items) ->
    if !items['url'+num]
      return
    document.getElementById('url'+num).value = items['url'+num]
    document.getElementById('color'+num).value = items['color'+num]
    document.getElementById('message'+num).value = items['message'+num]
  )

reset = (num) ->
  console.log("reset " + num)
  data = {}
  data['url'+num] = ""
  data['color'+num] = ""
  data['message'+num] = ""
  chrome.storage.sync.set(data)
