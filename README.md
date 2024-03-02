# PokeSteps ⚡️ 

A project inspired by Ash Ketchum's journey on building his team and becoming a Pokemon master. 

## Description 📝 

PokeSteps is a Pokedex with a step counter built into it. The motivation for this application is to help users enjoy their fitness journey. People often forfeit when the results are not obvious after trying for a period of time. This project hopes to remind users that "the getting there" is just as important as arriving at the destination.

> It's not the destination, it's the journey.
> 
> -- <cite>Ralph Waldo Emerson</cite>

<!-- Take screenshots of key views-->

<!-- Record a demo video on when goal is achieved and Pokemon is unlocked -->

## Getting Started 🛠️

In order to interact with this application, you must build it on a physical device rather than a simulator for HealthKit to retrieve step counts.

### Build project using a cable 🔌

1. Clone this project
2. Open project in Xcode
3. Enable Developer Mode on iOS device (skip if already enabled)

    a. Go to Settings > Privacy & Security > enable Developer Mode toggle

    b. Follow onscreen instructions to restart device

4. Connect phone to to Mac using cable
    
    a. If this is the first time connecting to the computer, you may be prompted to "Trust" this machine
    
5. In the toolbar at the top, click on device name and drop down should pop up
6. Select your iOS device

### Build project over network 🛜
A couple of requirements before project can be built onto the device over network:

* iOS device must be set up and added as a run destination (follow Build project using a cable)
* iOS device must be enabled to connect vis network
* iOS device and Mac must be connected to the same network/Wi-Fi

To enable or verify that "connect via network" is enabled:

1. Click on the device name in the toolbar
2. Go to Manage Run Destinations
3. Verify that "Connect via Network" checkbox is checked for the iOS device

Once the above requirements are met, you should be able to select your device as a run destination without connecting it to the Mac. There should be globe icon next to the device name in the drop down menu.

For visual learners: [Run Your App on Your Physical Device (No Cable)](https://www.youtube.com/watch?v=ld-BWEyAyL0)

## Architecture 🏗️

PokeSteps is built using the Model-View-ViewModel (MVVM) design pattern.

### Structure 🗃️

```
.
├── PokeSteps
│   ├── Data
│   │   ├── PokemonFetchingClient.swift             # No. 1
│   │   └── pokemon.json                            # No. 2
│   ├── Models                                      # Contains all models
│   │   └── Pokemon.swift                           # No. 3
│   ├── PokeStepsApp.swift
│   ├── ViewModels                                  # Contains all ViewModels
│   │   ├── HealthManager.swift                     # No. 4
│   │   └── PokemonManager.swift                    # No. 5
│   └── Views
│       ├── Health                                  # Contains all user health stats related views
│       │   ├── ActivityCardView.swift              # No. 6
│       │   └── StepCounterView.swift               # No. 7
│       └── Pokemon                                 # Contains all Pokemon related views
│           ├── PokedexView.swift                   # No. 8
│           └── PokemonView.swift                   # No. 9
├── PokeStepsTests                                  # Contains all unit tests for project models
│   └── PokeStepsTests.swift
├── PokeStepsUITests                                # Contains all UI tests for project views
│   ├── PokeStepsUITests.swift
│   └── PokeStepsUITestsLaunchTests.swift
└── README.md
```

| No. | Details |
| ---- | ------- |
| 1 | Client that makes the call to PokemonAPI to fetch the Pokemons JSON data. |
| 2 | Contains the JSON for the first 151 Pokemons. Used for development & testing purpose to avoid hitting the API multiple times for the same data. |
| 3 | Model containing the Pokemon struct, defining all the properties of a `Pokemon`. |
| 4 | Manages the HealthKit integration and Health data |
| 5 | Manages Pokemon data |
| 6 | Displays relevant info for a `HKQuantityType` |
| 7 | Displays the steps goal and the total steps user has taken so far today |
| 8 | Displays all 151 Pokemons |
| 9 | Reusable view that defines how each Pokemon should be displayed |

## Tools 🧰

* Xcode 15
* Swift 5.5
* SwiftUI
* HealthKit
* PokemonAPI
