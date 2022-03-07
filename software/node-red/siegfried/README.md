# Node RED Project documentation

The project is divided in multiple flows:

- Hardware Layer
-
-
-

## Hardware Layer

In this flow state of output gpios is set and state of input gpios is read.

### Outputs

This part of the flow is triggered from external flows. An Switch Flow redirect the msg payload accordingly to the msg topic.
To change the state of an Hardware Output the message must have the following syntax:

- msg.payload = state of output
- msg.topic = output name

#### Name of outputs and its possible states:

- fridge (boolean)
  - true
  - false
- charger (boolean)
  - true
  - false
- inverter (boolean)
  - true
  - false
- battery_select (string)
  - lfp_battery
  - lead_battery
- pump(boolean)
  - true
  - false
- aux_output (boolean)
  - true
  - false

### Bistable Relais

The hardware is equipped with bistable relais in order to save energy. Each relais has a "turn on coil" and a "turn off coil".
The software was so implemented that 100ms after one of both coils is turned on then both coils are turned back off.

## Inputs

As the state of any gpio input changes this part of the flow is triggered and and the state of each input stored on a global array is updated.

### Name of inputs stored as global variables:

- input_state() (array)
  - switch_kitchen
  - switch_living_room
  - aux_input_1
  - aux_input_2
