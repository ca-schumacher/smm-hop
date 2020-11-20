# smm-hop
Sensor-Motor Maps of a hopping model with sensor blending 

**Details about the Model and Methods**

Schumacher C and Seyfarth A (2017) Sensor-Motor Maps for Describing Linear Reflex Composition in Hopping. Front. Comput. Neurosci. 11:108.

https://www.frontiersin.org/articles/10.3389/fncom.2017.00108/full#B49

## HowTo - Start Simulation

1. Run 'INIT_Hop.m' to initialize the model parameters and run the simulation model (MOD_Hop.slx)
3. Uncomment the vizualization line (#72) and have fun playing with the parameters ;)

## HowTo - Create Sensor-Motor Maps
1. Run 'Lambdas.m' to create a look-up table of blending factos which fulfil the conditions: 0<lambda_i<1, Sum(lambda_i)=1. *Change the parameter **num_steps** to define the resolution (number of sample points per line) of the Sensor-Motor Map* 
2. Run 'EVAL_smm.m' to computes the Sensor-Motor Maps and evaluates their performance based on the outcome measures, e.g. hopping stability, frequency or height & metabolic effort,  as defined in the script. The resulting data is stored in a matlab data file 'DATA_results_smm.mat'
