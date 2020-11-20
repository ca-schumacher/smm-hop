# smm-hop
Sensor-Motor Maps of a hopping model with sensor blending 

**Details about the Model and Methods**

Schumacher C and Seyfarth A (2017) Sensor-Motor Maps for Describing Linear Reflex Composition in Hopping. Front. Comput. Neurosci.

https://www.frontiersin.org/articles/10.3389/fncom.2017.00108/full#B49

## HowTo - Start Simulation

1. Run 'INIT_Hop.m' to initialize the model parameters and run the simulation model (MOD_Hop.slx)
3. Uncomment the vizualization line (#72) and have fun playing with the parameters ;)

## HowTo - Create Sensor-Motor Maps

1. Run 'Lambdas.m' to define the blending factos given the conditions: 0<lambda_i<1, Sum(lambda_i)=1. *Change the parameter **num_steps** to define the resolution (number of sample points per line) of the Sensor-Motor Map*. The script saves a look-up table of the blending factors, called 'DATA_lambdas.mat'.
2. Run 'EVAL_smm.m' to computes the Sensor-Motor Maps and evaluate the predicted model behavior based on several outcome measures, e.g. hopping stability, frequency or height & metabolic effort. The resulting data is stored in a matlab data file 'DATA_results_smm.mat'.
3. Run 'PLOT_smm.m' to create plots of the Sensor-Motor Maps. Viola!
