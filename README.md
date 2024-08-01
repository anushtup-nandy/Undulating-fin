# Bio-mimetic Undulating Fin robot:

This is a bio-mimetic robot I have been developing as part of a project at my university (BITS-Pilani, Hyderabad Campus).

Objective: To develop an underwater robot capable of locomotion without using propellers, rather propells using nature inspired mechanism (inspired from stingrays)

Mini-objectives:
- [x] Modular and flexible Undulating fin prototype (using arduino, towerpro servomotors-10kg/cm, aluminium rays and silicon sheet).
  - [x] Give sinusoidal motion to the fin-rays and due to that the silicon sheet executes a sinusoidal motion.
- [x] Propulsion studies (using NI DAQ 9237 and beam type load cells).
  - [x] Experimental setup inside water tunnel
  - [x] Interface NI-DAQ to MATLAB and arduino ide to automate propulsion data collection.
  - [x] Conduct studies for 3 amplitudes (10, 20 and 30 degrees), 3 phases (0.26, 0.52 and 0.8) and  and 3 frequencies (1, 2, and 3 Hz)
- [x] Study wave nature of the sinusoidal motion produced by silicon sheet.
- [x] Hull for underwater rover
- [x] Servo mounts
- [ ] Interface Arduino with RPi and use waveshare servomotors

## Pictures of the work done:
Initial Prototype           |  Wave traced | Sine-wave formed 
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/anushtup-nandy/Undulating-fin/blob/main/pic/sample-prot.jpg?raw=true)  |  ![](https://github.com/anushtup-nandy/Undulating-fin/blob/main/pic/wave-trace.jpg?raw=true)|  ![](https://github.com/anushtup-nandy/Undulating-fin/blob/main/pic/sinusoidal-wave.jpg)

Force plot           |  Force-plot low pass filter
:-------------------------:|:-------------------------:
![](https://github.com/anushtup-nandy/Undulating-fin/blob/main/pic/force%20plot.png)  |  ![](https://github.com/anushtup-nandy/Undulating-fin/blob/main/pic/plot_low_pass.png)

