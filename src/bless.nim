import os, tables, strutils

proc yes(question: string): bool =
  echo question, " (y/n)"
  while true:
    case readLine(stdin)
    of "y", "Y", "yes", "Yes": return true
    of "n", "N", "no", "No": return false
    else: echo "Please be clear: yes or no"




const available: Table[string, seq[string]] = {
    # Pick something from the old testament so that it is compatible with all 3 main abrahamic religions.
    "God": @[
        "Numbers 6:24-26",
        "The Lord bless you and keep you;",
        "The Lord make his face to shine upon you and be gracious to you;",
        "The Lord lift up his countenance upon you and give you peace."
    ],
    # Alternative option for atheist
    "Odin": @[
        "Odin, far-wanderer, grant me wisdom,",
        "Courage, and victory.",
        "Friend Thor, grant me your strength.",
        "And both be with me."
    ]
}.toTable

when isMainModule:
    if not yes("Ready to perform the blessing ritual?"):
        echo "Ok, restart bless when you are ready."
        quit(1)

    sleep(600)
    echo "Ok, Pick a super natural spririt to call!"

    var counter = 1
    var keys: seq[string]
    for spirit, _ in available:
        echo counter,") ", spirit
        keys.add(spirit)
        inc counter
        sleep(400)

    sleep(600)
    echo "Enter the number corresponding on the spirit"
    var inpt = 0
    
    while true:
        try:
            inpt = readLine(stdin).parseInt
            if inpt < 1 or inpt > keys.len:
                echo "Enter a number corresponding to an element of the list!"
                continue
            break
        except ValueError:
            echo "Enter a valid number!"
    sleep(600)
    let name = keys[inpt-1]
    echo "You picked ...."
    sleep(1000) 
    echo name
    sleep(600)
    echo "Performing the blessing."
    sleep(600)
    stdout.write "Please wait"
    for i in 0..50:
        stdout.write "."
        sleep(400)
    echo ""
    echo "Blessing loaded."
    sleep(1000)
    for line in available[name]:
        echo line
        sleep(1200)
    sleep(600)
    echo "Blessing performed."
    sleep(500)
    echo "Cleaning up"
    for i in 0..10:
        stdout.write "."
        sleep(300)
    sleep(800)
    echo "Congratulations! You are now blessed."
    sleep(300)
    echo "Please enjoy your blessing and proceed with your daily activities."
