# Plot
<img width="926" height="522" alt="image" src="https://github.com/user-attachments/assets/a5b53fa4-bf81-4885-91bc-aaa0e908f443" />


# Tasks
## Increase Gateway Height by +5 m

1)Does maximum LOS distance change?

2)Does link feasibility improve significantly?

3)Why?

Answer:

1)Yes, increased (21km->22.9km)

2)Not significantly

3)Because link feasibility doesn't depend on gateway height

## Increase Antenna Gain to 5 dBi

1)How does the received power curve change?

2)How much additional range is achieved?

3)Why does antenna gain extend coverage?

Answer:

1)It shifts upward by 6 dB (3 dB from TX + 3 dB from RX). The shape remains the same.

2)For n=2.7 range increased by about 67% (≈ 1.67× longer distance).

3)Because gain increases effective radiated power and received signal strength without increasing noise, improving SNR and allowing longer communication distance.

## Change Environment Exponent

1)How does increasing n affect coverage?

2)Which has stronger impact on range: gain increase or environment change?

3)Explain physically.

Answer:

1)Increasing n makes signal attenuate faster over distance, reducing coverage range.

2)Environment change

3)Higher n represents more obstacles, reflections, scattering, absorption. These environmental losses dominate over moderate gain improvements.

## Move Gateway Location (Fresnel Study)

1)Where is Fresnel radius largest?

2)Why is midpoint usually critical?

3)What happens if clearance rule (60%) is violated?

Answer:

1)xObs_4 = 0.5*D (r=18.59m)

2)Because the Fresnel zone radius is maximum there, requiring the greatest clearance.

3)Diffraction loss increases, received power drops significantly, and the link may fail even if LOS visually exists.


# Conclusion

This study shows that antenna gain improves coverage by increasing received power uniformly across distance. However, environmental conditions have a much stronger effect on link performance because they control how fast the signal decays. Increasing antenna height mainly improves geometric line-of-sight but does not change received power in the log-distance model. Fresnel zone clearance is critical, especially at the midpoint, where obstruction causes maximum diffraction loss. Small design choices, such as antenna gain and placement, can significantly affect link reliability. Proper RF planning requires balancing geometry, environment, and link budget together rather than optimizing only one parameter.

In practical wireless deployment, the environment (path loss exponent n) has the strongest impact on coverage, because obstacles, buildings, terrain, and scattering fundamentally determine how fast signal power decreases over distance.
