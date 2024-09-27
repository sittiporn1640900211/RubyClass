# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end
  
    def introduce
      puts "Hello, my name is #{@name}. My Email is #{@email} and password is #{@password}."
    end
  
    # add a method to user so, user can enter to a room
    def enter_room(room)
      room.users << self
      puts "#{@name} has entered the room: #{room.name}"
    end
  
    # add a method to user so, user can send a message to a room
    def send_message(room, content)
      message = Message.new(self.name, room.name, content)
      room.broadcast(message)
    end
  
    # user.acknowledge_message(room, message)
    def acknowledge_message(room, message)
      puts "#{@name} acknowledges the message: '#{message.content}' in room: #{room.name}"
    end
  end
  
  user = User.new("Sittiporn", "Sittiporn.khan@bumail.net", "blablabla")
  user.introduce
  
  # create a new Class, Room, that has the following attributes:
  # - name
  # - description
  # - users
  class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description, users = [])
      @name = name
      @description = description
      @users = users
    end
  
    def introduce
      puts "I am learning #{@name} at #{@description} with #{@users.join(', ')}."
    end
  
    # add a method to a room, so it can broadcast a message to all users
    def broadcast(message)
      puts "Broadcasting message from #{message.user} in #{message.room}: #{message.content}"
      @users.each do |user|
        user.acknowledge_message(self, message)
      end
    end
  end
  
  room = Room.new("B4-409 Room", "Building B4")
  room.introduce
  
  # create a new Class, Message, that has the following attributes:
  # - user
  # - room
  # - content
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  
    def introduce
      puts "User: #{@user}, Room: #{@room}, Content: #{@content}"
    end
  end
  
  message = Message.new("Tae", "B4-409 Room", "Hello, everyone!")
  message.introduce
  