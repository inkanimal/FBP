player_list = {
    "Jose Altuve" => {
      :position => "2B", :bats => "Right", :throws => "Right"
    },
    "Robinson Cano" => {
      :position => "2B", :bats => "Left", :throws => "right"
    },
    "Brian Dozier" => {
      :position => "2B", :bats => "Right", :throws => "Right"
    },
    "Daniel Murphy" => {
      :position => ["2B", "1B", "3B"], :bats => "Left", :throws => "Right"
    },
    "Dustin Pedroia" => {
      :position => "2B", :bats => "Right", :throws => "Right"
    },
    "Jonathan Schoop" => {
      :position => "2B", :bats => "Right", :throws => "Right"
    },
    "Ian Kinsler" => {
      :position => "2B", :bats => "Right", :throws => "Right"
    },
    "Neil Walker" => {
      :position => "2B", :bats => "Switch", :throws => "Right"
    },
    "Cesar Hernandez" => {
      :position => ["2B", "3B"], :bats => "Switch", :throws => "Right"
    },
    "Carlos Correa" => {
      :position => "SS", :bats => "Right", :throws => "Right"
    },
    "Corey Seager" => {
      :position => "SS", :bats => "Leftt", :throws => "Right"
    },
    "Francisco Lindor" => {
      :position => "SS", :bats => "Switch", :throws => "Right"
    },
    "Trea Turner" => {
      :position => ["SS", "CF", "2B"], :bats => "Right", :throws => "Right"
     },
    "Andrelton Simmons" => {
      :position => "SS", :bats => "Right", :throws => "Right"
     },
    "Jean Segura" => {
      :position => ["SS", "2B"], :bats => "Right", :throws => "Right"
     },
    "Paul DeJong" => {
      :position => ["SS", "2B"], :bats => "Right", :throws => "Right"
     },
    "Elvis Andrus" => {
      :position => "SS", :bats => "Right", :throws => "Right"
     },
    "Trevor Story" => {
      :position => "SS", :bats => "Right", :throws => "Right"
     },
    "Tim Beckham" => {
      :position => ["SS", "2B", "3B"], :bats => "Right", :throws => "Right"
     },
     "Kris Bryant" => {
      :position => ["3B", "OF"], :bats => "Right", :throws => "Right"
      },
     "Nolan Arenado" => {
      :position => "3B", :bats => "Right", :throws => "Right"
      },
     "Josh Donaldson" => {
       :position => "3B", :bats => "Right", :throws => "Right"
      },
     "Justin Turner" => {
       :position => ["3B", "2B", "SS"], :bats => "Right", :throws => "Right"
      },
     "Anthony Rendon" => {
       :position => "3B", :bats => "Right", :throws => "Right"
      },
     "Adrian Beltre" => {
       :position => "3B", :bats => "Right", :throws => "Right"
      },
     "Jose Ramirez" => {
      :position => "3B", :bats => "Switch", :throws => "Right"
      },
     "Manny Machado" => {
       :position => ["3B, SS"], :bats => "Right", :throws => "Right"
      },
     "Alex Bregman" => {
       :position => "3B", :bats => "Right", :throws => "Right"
      },
     "Kyle Seager" => {
      :position => "3B", :bats => "Left", :throws => "Right"
      },
      "Marcell Ozuna" => {
        :position => ["LF", "OF"], :bats => "Right", :throws => "Right"
       },
      "Yoenis Cespedes" => {
        :position => "LF", :bats => "Right", :throws => "Right"
       },
      "Justin Upton" => {
        :position => "LF", :bats => "Right", :throws => "Right"
       },
      "Ryan Braun" => {
        :position => "LF", :bats => "Right", :throws => "Right"
       },
      "Trey Mancini" => {
        :position => "LF", :bats => "Right", :throws => "Right"
       },
      "Khris Davis" => {
       :position => "LF", :bats => "Right", :throws => "Right"
       },
      "Adam Eaton" => {
        :position => ["LF", "OF"], :bats => "Left", :throws => "Left"
       },
      "Andrew Benintendi" => {
        :position => "LF", :bats => "Left", :throws => "Left"
       },
      "Marwin Gonzalez" => {
        :position => ["LF", "SS", "1B"], :bats => "Switch", :throws => "Right"
       },
      "Brett Gardner" => {
        :position => "LF", :bats => "Left", :throws => "Left"
       }
  }

  player_list.each do |name, player_hash|
    p = Player.new
    p.name = name
    player_hash.each do |attribute, value|
        p[attribute] = value
    end
    p.save
  end
