class Game
  
  def initialize(start)
    @quips = [
      "You died. You kinda suck at this.",
      "Nice job, you died jackass.",
      "Such a loser.",
      "I have a small puppy who is better at this."]

    @start = start
    puts "it init @start = " + @start.inspect
  end

  def prompt()
    print "> "
  end

  def play()
    puts "@start => " + @start.inspect
    next_room = @start

    while true
      puts "\n--------"
      room = method(next_room)
      next_room = room.call()
    end
  end

  def death()
    puts @quips[rand(@quips.length())]
    Process.exit(1)
  end

  def central_corridor()
    puts <<-PARAGRAPH
    The Gothons of Planet Percal #25 have invaded your ship and destroyed
    your entire crew. You are the last surviving member and your last
    mission is to get the neutron destruct bomb from the Weapons Armory
    put it in the bridge, and blow the ship up after getting into an 
    escape pod.
    PARAGRAPH
    puts "\n--------"
    puts <<-PARAGRAPH
    You're running down the central corridor to the Weapons Armory when
    a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume
    flowing around his hate filled body. He's blocking the door to the
    Armory and about to pull a weapon to blast you.
    PARAGRAPH

    prompt(); action = gets.chomp()

    if action.include? "shoot"
      puts <<-PARAGRAPH
      Quick on the draw you yank out your blaster and fire it at the Gothon.
      His clown costume is flowing and moving around his body, which throws
      off your aim. Your laser hits his costume but misses him entirely. This
      completely ruins his brand new costume his mother bought him, which
      makes him fly into an insane rage and blast you repeteadly in the face until
      you are dead. Then he eats you.
      PARAGRAPH
      return :death

    elsif action.include? "dodge"
      puts <<-PARAGRAPH
      Like a world class boxer you dodge, weave, slip and slide right
      as the Gothon's blaster cranks a laser past your head.
      In the middle of an artful dodge your foot slips and you
      bang your head to the metal wall and pass out.
      You wake up shortly after only to die as the Gothon stomps on
      your head and eats you.
      PARAGRAPH
      return :death

    elsif action.include? "joke"
      puts <<-PARAGRAPH
      Lucky for you they made you learn Gothons insults in the academy.
      You tell the one Gothon joke you know:
      Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr.
      The Gothon stops, tries not to laugh, then busts out laughing and can't move.
      While he's laughing you run up and shoot him square in his head.
      putting him down, then jump throught the Weapon Armory door.
      PARAGRAPH
      return :laser_weapon_armory

    else
      puts "DOES NOT COMMUTE!"
      return :central_corridor
    end
  end

  def laser_weapon_armory()
    puts <<-PARAGRAPH
    You do a dive roll into the Weapon Armory, crouch and scan the room
    for more Gothons that might be hiding. It's dead quiet, too quiet.
    You stand up and run to the far side of the room and find the
    neutron bomb in it's container. There's a keypad lock on the box
    and you need the code to get the bomb out. If you get the code
    wrong 10 times then the lock closes forever and you can't
    get the bomb. The code is 3 digits.
    PARAGRAPH
    cheat = '420'
    code = "%s%s%s" % [rand(9)+1, rand(9)+1, rand(9)+1]
    print "[Keypad]> "
    guess = gets.chomp()
    guesses = 0

    while guess != code and guesses < 10 and guess != cheat
      puts "BZZZZZZZDT!"
      guesses += 1
      print "[Keypad]> "
      guess = gets.chomp()
    end

    if guess == code
      puts <<-PARAGRAPH
      The container clicks open and the seal breaks, letting gas out
      You grab the neutron bomb and run as fast as you can to the
      bridge where you must place it in the right spot.
      PARAGRAPH
      return :the_bridge

    elsif guess == cheat
      puts <<-PARAGRAPH
      The container makes some weird noise, alarm starts blazing.
      "SELF DESTRUCT MODE ACTIVATED"
      "Self destructing in T minus 15 seconds"
      Listening to this, you jump straight into the escape pod room.
      PARAGRAPH
      return :escape_pod

    else
      puts <<-PARAGRAPH
      The lock buzzes one more time and you hear a sickening
      melting sound as the mechanism is fused together.
      You decide to sit there, and finally the Gothons blow up the
      ship from their ship and you die.
      PARAGRAPH
      return :death
    end
  end

  def the_bridge()
    puts <<-PARAGRAPH
    You bust onto the bridge witht he neutron destruct bomb
    under you arm and surprise 5 Gothons who are tying to
    take control of the ship. Each of them has as even uglier
    clown costume than the last. They haven't pulled their
    weapons out yet, as they see the active bomb under you
    arm and don't want to set it off.
    PARAGRAPH

    prompt(); action = gets.chomp()

    if action == "throw the bomb"
      puts <<-PARAGRAPH
      In a panic you throw the bomb at the group of Gothons
      and make a leap for the door. Right as you drop it a
      Gothon shoots you right in the back killing you.
      As you die you see another Gothon frantically try to disarm
      the bomb. You die knowing they will probably blow up when
      it goes off.
      PARAGRAPH
      return :death

    elsif action == "slowly place the bomb"
      puts <<-PARAGRAPH
      You point your blaster at the bomb under your arm
      and the Gothons put their hands up and start to sweat.
      You inch backward to the door, open it, and then carefully
      place the bomb on the floor, pointing your blaster at it.
      You then jump back through the door, punch the close button
      and blast the lock so the Gothons can't get out.
      Now that the bomb is placed you run to the escape pod to
      get off this tin can.
      PARAGRAPH
      return :escape_pod
      else
      puts "DOES NOT COMPUTE!"
      return :the_bridge
    end
  end

  def escape_pod()
    puts <<-PARAGRAPH
    You rush through the ship desperately trying to make it to
    the escape pod before the whole ship explodes. It seems like
    hardly any Gothons are on the ship, so your run is clear of
    interference. You get to the chamber with the escape pods, and
    now need to pick one to take. Some of them could be damaged
    but you don't have time to look. There's 5 pods, which one do you take?
    PARAGRAPH
    good_pod = rand(5)+1
    print "[pod #]> "
    guess = gets.chomp()

    if guess.to_i != good_pod
      puts <<-PARAGRAPH
      You jump into pod #{guess} and hit the eject button.
      The pod escapes out into the void of space, then
      implodes as the hull ruptures, crushing your body
      into jam jelly.
      PARAGRAPH
      return :death
    else
      puts <<-PARAGRAPH
      You jump into pod #{guess} and hit the eject button.
      The pod easily slides out into space heading to
      the planet below. As it flies to the planet, you look
      back and see your ship implode then explode like a
      bright star, taking out the Gothon ship at the same
      time. You won!
      PARAGRAPH
      Process.exit(0)
    end
  end
end

a_game = Game.new(:central_corridor)
a_game.play()
