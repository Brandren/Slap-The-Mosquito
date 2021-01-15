#Name: Ng Jing Ping
#ID: 101211418
##Date: 7 November 2020
### Custom Program
require 'rubygems'
require 'gosu'

## Z-order for my Custom Program
module ZOrder
  BACKGROUND, BACK, MIDDLE, TOP, STARTBACKGROUND, STARTBACK, STARTMIDDLE, STARTTOP = *0..7
end


# Global constants
WIN_WIDTH = 840
WIN_HEIGHT = 600

#####            Window
class GameWindow < Gosu::Window
# set up variables and attributes
def initialize
  super(WIN_WIDTH, WIN_HEIGHT, false)
  self.caption = "Slap The Mosquito"
#####            Track and song and sound effect
  @slash = Gosu::Sample.new("media/slash.mp3")
  @slap = Gosu::Sample.new("media/slap.mp3")
  @track = Gosu::Song.new("media/chillhop.mp3")
  @mosquito_sound = Gosu::Sample.new("media/mosquito_sound.mp3")
  @bomb_sound = Gosu::Sample.new("media/bomb_sound.mp3")
#####            Main Backgroumd
  @background_start = Gosu::Image.new("media/background.png", :tileable => false)
  @gametitle = Gosu::Image.new("media/gametitle.png", :tileable => false)
  @mosquitoandbomb = Gosu::Image.new("media/mosquitoandbomb.png", :tileable => false)
  @startbtn = Gosu::Image.new("media/startbtn.png", :tileable => false)
#####           Main Window
  @locbackground_start= [0,0]
  @locgametitle=[10,0]
  @locmosquitoandbomb=[0,0]
  @locstartbtn=[0,0]
  @locclock=[40,540]
#####            Game Backgroumd
  @background_image = Gosu::Image.new("media/background.png", :tileable => false)

#####            GameWindow
#####            Mosquito
  @locmosquito1 = [rand(10..700),600]
  @speedMo1UY= 1
  @speedMo1DY= 610
  @stopMo1 = rand(10..350)
  @mosquito1 = Gosu::Image.new("media/mosquito.png", :tileable => true)

  @locmosquito2 = [rand(10..700),600]
  @speedMo2UY= 1
  @speedMo2DY= 610
  @stopMo2 = rand(10..350)
  @mosquito2 = Gosu::Image.new("media/mosquito.png", :tileable => true)

  @locmosquito3 = [rand(10..700),600]
  @speedMo3UY= 1
  @speedMo3DY= 610
  @stopMo3 = rand(10..350)
  @mosquito3 = Gosu::Image.new("media/mosquito.png", :tileable => true)

  @locmosquito4 = [rand(10..700),600]
  @speedMo4UY= 1
  @speedMo4DY= 610
  @stopMo4 = rand(10..350)
  @mosquito4 = Gosu::Image.new("media/mosquito.png", :tileable => true)

  @locmosquito5 = [rand(10..700),600]
  @speedMo5UY= 1
  @speedMo5DY= 610
  @stopMo5 = rand(10..350)
  @mosquito5 = Gosu::Image.new("media/mosquito.png", :tileable => true)

  @locmosquito6 = [rand(10..700),600]
  @speedMo6UY= 1
  @speedMo6DY= 610
  @stopMo6 = rand(10..350)
  @mosquito6 = Gosu::Image.new("media/mosquito.png", :tileable => true)

  @locmosquito7 = [rand(10..700),600]
  @speedMo7UY= 1
  @speedMo7DY= 610
  @stopMo7 = rand(10..350)
  @mosquito7 = Gosu::Image.new("media/mosquito.png", :tileable => true)

  @locmosquito8 = [rand(10..700),600]
  @speedMo8UY= 1
  @speedMo8DY= 610
  @stopMo8 = rand(10..350)
  @mosquito8 = Gosu::Image.new("media/mosquito.png", :tileable => true)

  @locmosquito9 = [rand(10..700),600]
  @speedMo9UY= 1
  @speedMo9DY= 610
  @stopMo9 = rand(10..350)
  @mosquito9 = Gosu::Image.new("media/mosquito.png", :tileable => true)

  @locmosquito10 = [rand(10..700),600]
  @speedMo10UY= 1
  @speedMo10DY= 610
  @stopMo10 = rand(10..350)
  @mosquito10 = Gosu::Image.new("media/mosquito.png", :tileable => true)


#####            Boom
  @locboom1 = [rand(10..700),600]
  @speedBo1UY= 1
  @speedBo1DY= 610
  @stopBo1 = rand(10..350)
  @boom1 = Gosu::Image.new("media/boom.png", :tileable => true)

  @locboom2 = [rand(10..700),600]
  @speedBo2UY= 1
  @speedBo2DY= 610
  @stopBo2 = rand(10..350)
  @boom2 = Gosu::Image.new("media/boom.png", :tileable => true)

  @locboom3 = [rand(10..700),600]
  @speedBo3UY= 1
  @speedBo3DY= 610
  @stopBo3 = rand(10..350)
  @boom3 = Gosu::Image.new("media/boom.png", :tileable => true)

#####            Window Font Size
  @font = Gosu::Font.new(28)

#####            Score Menu Font Size
  @menufont1 = Gosu::Font.new(50)
  @menufont2 = Gosu::Font.new(28)
  @menufont3 = Gosu::Font.new(22)

#####            Game Bottom Text Foreground
  @textbg = Gosu::Color.rgba(0,0,0,100)

#####            Score Menu Text Foreground
  @menutextbg = Gosu::Color.rgba(0,0,0,100)

#####            Life
  @life = Gosu::Image.new("media/life.png", :tileable => true)
  @loclife = [70,535]

  @speedLi1DY= 610
  @loclife1 = [70,535]

  @speedLi2DY= 610
  @loclife2 = [70,535]

  @speedLi3DY= 610
  @loclife3 = [70,535]

#####            Timer
  @time = 0
  @clock = Time.new
#####            Score
  @score = 0
end

# updates elements
def update
  @locstartbtn=[0,0]
  @clock = Time.new
  #####            Update Main Window
  @locgametitle[0]+=Math.sin(Time.now.to_f)*0.3
  @locgametitle[1]+=Math.cos(Time.now.to_f)*0.1
  @locmosquitoandbomb[0]+=Math.sin(Time.now.to_f)*1
  @locmosquitoandbomb[1]+=Math.cos(Time.now.to_f* 10)*2
  if ((mouse_x > 558 and mouse_x < 840) and (mouse_y > 483 and mouse_y < 563))
    @locstartbtn[0] = 10
  end
  if @locbackground_start[0] < - 800 and @locgametitle[0] < -800 and @locmosquitoandbomb[0] < -800
    @locstartbtn[0]= -1000
    #####            Update Mosquito
    if @locmosquito1[1] == @speedMo1DY
      @locmosquito1 = [rand(10..700),600]
    end
    if @locmosquito1[1] < @stopMo1
      @locmosquito1[1] = @speedMo1DY
    end
    if @locmosquito1[1] > 0 and @locmosquito1[1] <= 600
      @locmosquito1[1] -= @speedMo1UY
    end

    if @locmosquito2[1] == @speedMo2DY
      @locmosquito2 = [rand(10..700),600]
    end
    if @locmosquito2[1] < @stopMo2
      @locmosquito2[1] = @speedMo2DY
    end
    if @locmosquito2[1] > 0 and @locmosquito2[1] <= 600
      @locmosquito2[1] -= @speedMo2UY
    end

    if @locmosquito3[1] == @speedMo3DY
      @locmosquito3 = [rand(10..700),600]
    end
    if @locmosquito3[1] < @stopMo3
      @locmosquito3[1] = @speedMo3DY
    end
    if @locmosquito3[1] > 0 and @locmosquito3[1] <= 600
      @locmosquito3[1] -= @speedMo3UY
    end

    if @locmosquito4[1] == @speedMo4DY
      @locmosquito4 = [rand(10..700),600]
    end
    if @locmosquito4[1] < @stopMo4
      @locmosquito4[1] = @speedMo4DY
    end
    if @locmosquito4[1] > 0 and @locmosquito4[1] <= 600
      @locmosquito4[1] -= @speedMo4UY
    end

    if @locmosquito5[1] == @speedMo5DY
      @locmosquito5 = [rand(10..700),600]
    end
    if @locmosquito5[1] < @stopMo5
      @locmosquito5[1] = @speedMo5DY
    end
    if @locmosquito5[1] > 0 and @locmosquito5[1] <= 600
      @locmosquito5[1] -= @speedMo5UY
    end

    if @locmosquito6[1] == @speedMo6DY
      @locmosquito6 = [rand(10..700),600]
    end
    if @locmosquito6[1] < @stopMo6
      @locmosquito6[1] = @speedMo6DY
    end
    if @locmosquito6[1] > 0 and @locmosquito6[1] <= 600
      @locmosquito6[1] -= @speedMo6UY
    end

    if @locmosquito7[1] == @speedMo7DY
      @locmosquito7 = [rand(10..700),600]
    end
    if @locmosquito7[1] < @stopMo7
      @locmosquito7[1] = @speedMo7DY
    end
    if @locmosquito7[1] > 0 and @locmosquito7[1] <= 600
      @locmosquito7[1] -= @speedMo7UY
    end

    if @locmosquito8[1] == @speedMo8DY
      @locmosquito8 = [rand(10..700),600]
    end
    if @locmosquito8[1] < @stopMo8
      @locmosquito8[1] = @speedMo8DY
    end
    if @locmosquito8[1] > 0 and @locmosquito8[1] <= 600
      @locmosquito8[1] -= @speedMo8UY
    end

    if @locmosquito9[1] == @speedMo9DY
      @locmosquito9 = [rand(10..700),600]
    end
    if @locmosquito9[1] < @stopMo9
      @locmosquito9[1] = @speedMo9DY
    end
    if @locmosquito9[1] > 0 and @locmosquito9[1] <= 600
      @locmosquito9[1] -= @speedMo9UY
    end

    if @locmosquito10[1] == @speedMo10DY
      @locmosquito10 = [rand(10..700),600]
    end
    if @locmosquito10[1] < @stopMo10
      @locmosquito10[1] = @speedMo10DY
    end
    if @locmosquito10[1] > 0 and @locmosquito10[1] <= 600
      @locmosquito10[1] -= @speedMo10UY
    end

    #####            Update Boom
    if @locboom1[1] == @speedBo1DY
      @locboom1 = [rand(10..700),600]
    end
    if @locboom1[1] < @stopBo1
      @locboom1[1] = @speedBo1DY
    end
    if @locboom1[1] > 0 and @locboom1[1] <= 600
      @locboom1[1] -= @speedBo1UY
    end

    if @locboom2[1] == @speedBo2DY
      @locboom2 = [rand(10..700),600]
    end
    if @locboom2[1] < @stopBo2
      @locboom2[1] = @speedBo2DY
    end
    if @locboom2[1] > 0 and @locboom2[1] <= 600
      @locboom2[1] -= @speedBo2UY
    end

    if @locboom3[1] == @speedBo3DY
      @locboom3 = [rand(10..700),600]
    end
    if @locboom3[1] < @stopBo3
      @locboom3[1] = @speedBo3DY
    end
    if @locboom3[1] > 0 and @locboom3[1] <= 600
      @locboom3[1] -= @speedBo3UY
    end

    #####            Update Time
    if @time < 120
      @time += 0.016
    else
      @time = 120
    end
  end
end

# creates elements
def draw
  @track.play
  ###### Main Window
  @displayhighscorefile = File.new("highscore.txt","r")
  @displayhighscore = @displayhighscorefile.gets
  @displayhighscorefile.close
  @background_start.draw(@locbackground_start[0], @locbackground_start[1], ZOrder::STARTBACKGROUND)
  @gametitle.draw(@locgametitle[0], @locgametitle[1], ZOrder::STARTTOP)
  @mosquitoandbomb.draw(@locmosquitoandbomb[0], @locmosquitoandbomb[1], ZOrder::STARTMIDDLE)
  @startbtn.draw(@locstartbtn[0], @locstartbtn[1], ZOrder::STARTMIDDLE)
  @menufont3.draw_text(" #{@clock.ctime} • Highest Score: #{@displayhighscore}", @locclock[0], @locclock[1], z = ZOrder::STARTMIDDLE, 1.0, 1.0, Gosu::Color::WHITE)
  if @locbackground_start[0] < -800 and @locgametitle[0] <-800 and @locmosquitoandbomb[0] < -800
    ##### Game Window
    @displayhighscorefile = File.new("highscore.txt","r")
    @displayhighscore = @displayhighscorefile.gets
    @displayhighscorefile.close
    @background_image.draw(0, 0, ZOrder::BACKGROUND)
    @mosquito1.draw(@locmosquito1[0], @locmosquito1[1], ZOrder::BACK)
    @mosquito2.draw(@locmosquito2[0], @locmosquito2[1], ZOrder::BACK)
    @mosquito3.draw(@locmosquito3[0], @locmosquito3[1], ZOrder::BACK)
    @mosquito4.draw(@locmosquito4[0], @locmosquito4[1], ZOrder::BACK)
    @mosquito5.draw(@locmosquito5[0], @locmosquito5[1], ZOrder::BACK)
    @mosquito6.draw(@locmosquito6[0], @locmosquito6[1], ZOrder::BACK)
    @mosquito7.draw(@locmosquito7[0], @locmosquito7[1], ZOrder::BACK)
    @mosquito8.draw(@locmosquito8[0], @locmosquito8[1], ZOrder::BACK)
    @mosquito9.draw(@locmosquito9[0], @locmosquito9[1], ZOrder::BACK)
    @mosquito10.draw(@locmosquito10[0], @locmosquito10[1], ZOrder::BACK)
    @boom1.draw(@locboom1[0], @locboom1[1], ZOrder::BACK)
    @boom2.draw(@locboom2[0], @locboom2[1], ZOrder::BACK)
    @boom3.draw(@locboom3[0], @locboom3[1], ZOrder::BACK)
    Gosu.draw_rect(0, 500, WIN_WIDTH, 100, @textbg, ZOrder::MIDDLE, mode=:default)
    @font.draw_text("Life:", 10, 540, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)
    @life.draw(@loclife3[0], @loclife3[1], ZOrder::TOP)
    @life.draw(@loclife2[0]+50, @loclife2[1], ZOrder::TOP)
    @life.draw(@loclife1[0]+100, @loclife1[1], ZOrder::TOP)
    @font.draw_text("Timer: #{@time.round()}s", 350, 540, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)
    @font.draw_text("Score: #{@score}", 650, 540, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)
    Gosu.draw_rect(310, 10, 230, 50, @textbg, ZOrder::MIDDLE, mode=:default)
    @menufont2.draw_text("Highest Score: #{@displayhighscore}", 320, 20, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)

    #####No Life End Game
    if  @loclife3[1] == @speedLi3DY
      ##### Record the current score into score.txt
      @timenow = Time.new
      #puts time.ctime
      #puts time.strftime("%Y-%m-%d %H:%M:%S")
      @myfile = File.new("score.txt","a")
      @myfile.puts "Time: #{@timenow.ctime}  |  Score: #{@score}"
      @myfile.close
      #### Read the high score from highscore.txt
      @highscore = File.new("highscore.txt","r")
      @readfile = @highscore.gets
      @highscore.close
      #### Compare current score with high score from highscore.txt
      if  @score > @readfile.to_i
        #### Record the current score is higher than pervious high score into highscore.txt
        @highscorefile = File.new("highscore.txt","w")
        @highscorefile.puts "#{@score}"
        @highscorefile.close
      end
      @displayhighscorefile = File.new("highscore.txt","r")
      @displayhighscore = @displayhighscorefile.gets
      @displayhighscorefile.close
      Gosu.draw_rect(210, 150, 400, 280, @menutextbg, ZOrder::MIDDLE, mode=:default)
      @menufont1.draw_text("Game Over ^0^ !", 245, 180, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::RED)
      @menufont2.draw_text("Your Score: #{@score}", 320, 250, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)
      @menufont2.draw_text("Highest Score: #{@displayhighscore}", 310, 300, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)
      @menufont3.draw_text("Press KEY ESCAPE to End the Game !", 240, 370, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)
      def needs_cursor?
        false
      end
    end

    ##### Time out End Game
    if @time == 120
      @loclife3[1] += @speedLi3DY
      @loclife2[1] += @speedLi2DY
      @loclife1[1] += @speedLi1DY
      ##### Record the current score into score.txt
      @timenow = Time.new
      #puts time.ctime
      #puts time.strftime("%Y-%m-%d %H:%M:%S")
      @myfile = File.new("score.txt","a")
      @myfile.puts "Time: #{@timenow.ctime}  |  Score: #{@score}"
      @myfile.close
      #### Read the high score from highscore.txt
      @highscore = File.new("highscore.txt","r")
      @readfile = @highscore.gets
      @highscore.close
      #### Compare current score with high score from highscore.txt
      if  @score > @readfile.to_i
        #### Record the current score is higher than pervious high score into highscore.txt
        @highscorefile = File.new("highscore.txt","w")
        @highscorefile.puts "#{@score}"
        @highscorefile.close
      end
      @displayhighscorefile = File.new("highscore.txt","r")
      @displayhighscore = @displayhighscorefile.gets
      @displayhighscorefile.close
      Gosu.draw_rect(210, 150, 400, 280, @menutextbg, ZOrder::MIDDLE, mode=:default)
      @menufont1.draw_text("Time Out ^.^ !", 270, 180, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)
      @menufont2.draw_text("Your Score: #{@score}", 320, 250, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)
      @menufont2.draw_text("Highest Score: #{@displayhighscore}", 310, 300, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)
      @menufont3.draw_text("Press KEY ESCAPE to Restart the Game !", 220, 370, z = ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)
      def needs_cursor?
        false
      end
    end
  end
end

# this is called by Gosu to see if should show the cursor (or mouse)
def needs_cursor?
  true
end

##### Clicking Mouse fuction
def mouse_over_button?(mouse_x, mouse_y)
  if  @loclife3[1] == @speedLi3DY or @time == 120
    false
    mouse_x = -100
    mouse_y = -100
    # showing the mouse coordinates
    #puts mouse_x
    #puts mouse_y
    puts "Please Press ESCAPE Key to Restart or End the game.. Thank You!!"
  end
  if ((mouse_x > 0 and mouse_x < 840) and (mouse_y > 0 and mouse_y < 600))
      if ((mouse_x > 558 and mouse_x < 840) and (mouse_y > 483 and mouse_y < 563))
        if @locbackground_start[0]!= -1000 and @locgametitle[0]!=-1000 and @locmosquitoandbomb[0]!=-1000
          @slash.play
        end
        @locbackground_start= [-1000,0]
        @locgametitle=[-1000,0]
        @locmosquitoandbomb=[-1000,0]
        @locclock = [-1000,0]
        true
        mouse_x = 0
        mouse_y = 0
      end
      if ((mouse_x > 0 and mouse_x < 840) and (mouse_y > 0 and mouse_y < 500))
        if ((mouse_x > @locmosquito1[0] and mouse_x < @locmosquito1[0] + 100) and (mouse_y > @locmosquito1[1] and mouse_y < @locmosquito1[1] + 100))
          @locmosquito1[1] = @speedMo1DY
          @mosquito_sound.play
          @slap.play
          #####            Update Score
          @score += 1
          true
          mouse_x = 0
          mouse_y = 0
        end
        if ((mouse_x > @locmosquito2[0] and mouse_x < @locmosquito2[0] + 100) and (mouse_y > @locmosquito2[1] and mouse_y < @locmosquito2[1] + 100))
          @locmosquito2[1] = @speedMo2DY
          @mosquito_sound.play
          @slap.play
          #####            Update Score
          @score += 1
          true
          mouse_x = 0
          mouse_y = 0
        end
        if ((mouse_x > @locmosquito3[0] and mouse_x < @locmosquito3[0] + 100) and (mouse_y > @locmosquito3[1] and mouse_y < @locmosquito3[1] + 100))
          @locmosquito3[1] = @speedMo3DY
          @mosquito_sound.play
          @slap.play
          #####            Update Score
          @score += 1
          true
          mouse_x = 0
          mouse_y = 0
        end
        if ((mouse_x > @locmosquito4[0] and mouse_x < @locmosquito4[0] + 100) and (mouse_y > @locmosquito4[1] and mouse_y < @locmosquito4[1] + 100))
          @locmosquito4[1] = @speedMo4DY
          @mosquito_sound.play
          @slap.play
          #####            Update Score
          @score += 1
          true
          mouse_x = 0
          mouse_y = 0
        end
        if ((mouse_x > @locmosquito5[0] and mouse_x < @locmosquito5[0] + 100) and (mouse_y > @locmosquito5[1] and mouse_y < @locmosquito5[1] + 100))
          @locmosquito5[1] = @speedMo5DY
          @mosquito_sound.play
          @slap.play
          #####            Update Score
          @score += 1
          true
          mouse_x = 0
          mouse_y = 0
        end
        if ((mouse_x > @locmosquito6[0] and mouse_x < @locmosquito6[0] + 100) and (mouse_y > @locmosquito6[1] and mouse_y < @locmosquito6[1] + 100))
          @locmosquito6[1] = @speedMo6DY
          @mosquito_sound.play
          @slap.play
          #####            Update Score
          @score += 1
          true
          mouse_x = 0
          mouse_y = 0
        end
        if ((mouse_x > @locmosquito7[0] and mouse_x < @locmosquito7[0] + 100) and (mouse_y > @locmosquito7[1] and mouse_y < @locmosquito7[1] + 100))
          @locmosquito7[1] = @speedMo7DY
          @mosquito_sound.play
          @slap.play
          #####            Update Score
          @score += 1
          true
          mouse_x = 0
          mouse_y = 0
        end
        if ((mouse_x > @locmosquito8[0] and mouse_x < @locmosquito8[0] + 100) and (mouse_y > @locmosquito8[1] and mouse_y < @locmosquito8[1] + 100))
          @locmosquito8[1] = @speedMo8DY
          @mosquito_sound.play
          @slap.play
          #####            Update Score
          @score += 1
          true
          mouse_x = 0
          mouse_y = 0
        end
        if ((mouse_x > @locmosquito9[0] and mouse_x < @locmosquito9[0] + 100) and (mouse_y > @locmosquito9[1] and mouse_y < @locmosquito9[1] + 100))
          @locmosquito9[1] = @speedMo9DY
          @mosquito_sound.play
          @slap.play
          #####            Update Score
          @score += 1
          true
          mouse_x = 0
          mouse_y = 0
        end
        if ((mouse_x > @locmosquito10[0] and mouse_x < @locmosquito10[0] + 100) and (mouse_y > @locmosquito10[1] and mouse_y < @locmosquito10[1] + 100))
          @locmosquito10[1] = @speedMo10DY
          @mosquito_sound.play
          @slap.play
          #####            Update Score
          @score += 1
          true
          mouse_x = 0
          mouse_y = 0
        end


        if ((mouse_x > @locboom1[0] and mouse_x < @locboom1[0] + 100) and (mouse_y > @locboom1[1] and mouse_y < @locboom1[1] + 100))
          @locboom1[1] = @speedBo1DY
          @bomb_sound.play
          @slap.play

          #####            Update Life
          if @loclife1[1] < @speedLi1DY
            @loclife1[1] = @speedLi1DY
            @speedLi1DY = 620
          end
          if @loclife2[1] < @speedLi2DY and @loclife1[1] == 620
            @loclife2[1] = @speedLi2DY
            @speedLi2DY = 620
          end
          if @loclife3[1] < @speedLi3DY and @loclife2[1] == 620 and @loclife1[1] == 620
            @loclife3[1] = @speedLi3DY
          end
          true
          mouse_x = 0
          mouse_y = 0
        end
        if ((mouse_x > @locboom2[0] and mouse_x < @locboom2[0] + 100) and (mouse_y > @locboom2[1] and mouse_y < @locboom2[1] + 100))
          @locboom2[1] = @speedBo2DY
          @bomb_sound.play
          @slap.play

          #####            Update Life
          if @loclife1[1] < @speedLi1DY
            @loclife1[1] = @speedLi1DY
            @speedLi1DY = 620
          end
          if @loclife2[1] < @speedLi2DY and @loclife1[1] == 620
            @loclife2[1] = @speedLi2DY
            @speedLi2DY = 620
          end
          if @loclife3[1] < @speedLi3DY and @loclife2[1] == 620 and @loclife1[1] == 620
            @loclife3[1] = @speedLi3DY
          end
          true
          mouse_x = 0
          mouse_y = 0
        end
        if ((mouse_x > @locboom3[0] and mouse_x < @locboom3[0] + 100) and (mouse_y > @locboom3[1] and mouse_y < @locboom3[1] + 100))
          @locboom3[1] = @speedBo3DY
          @bomb_sound.play
          @slap.play

          #####            Update Life
          if @loclife1[1] < @speedLi1DY
            @loclife1[1] = @speedLi1DY
            @speedLi1DY = 620
          end
          if @loclife2[1] < @speedLi2DY and @loclife1[1] == 620
            @loclife2[1] = @speedLi2DY
            @speedLi2DY = 620
          end
          if @loclife3[1] < @speedLi3DY and @loclife2[1] == 620 and @loclife1[1] == 620
            @loclife3[1] = @speedLi3DY
          end
          true
          mouse_x = 0
          mouse_y = 0
        end
    end
  else
    false
    mouse_x = 0
    mouse_y = 0
  end
end


### =======    Allow using mouse clicking or pressing keyboard to get player's input    ====================
def button_down(id)
  if id == Gosu::KB_ESCAPE
    close
    ##### Record the current score into score.txt
    @timenow = Time.new
    #puts time.ctime
    #puts time.strftime("%Y-%m-%d %H:%M:%S")
    @myfile = File.new("score.txt","a")
    @myfile.puts "Time: #{@timenow.ctime}  |  Score: #{@score}"
    @myfile.close
    #### Read the high score from highscore.txt
    @highscore = File.new("highscore.txt","r")
    @readfile = @highscore.gets
    @highscore.close
    #### Compare current score with high score from highscore.txt
    if  @score > @readfile.to_i
      #### Record the current score is higher than pervious high score into highscore.txt
      @highscorefile = File.new("highscore.txt","w")
      @highscorefile.puts "#{@score}"
      @highscorefile.close
    end
  else
    super
  end
  # ==== This mouse_over_button is to allow player to right clicking on object=====
  case id
  when Gosu::MsLeft
      if mouse_over_button?(mouse_x, mouse_y)
      end
  end
end

#@slap.play
end

# Lets get started!
GameWindow.new.show
