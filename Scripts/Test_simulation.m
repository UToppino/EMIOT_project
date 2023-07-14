% Simulation script

% Generate time steps
t = 0:0.001:90;
t = t';

% Generate data signals
current         = [t,ones(size(t))*5];        % [A]
init_cap        = [t,ones(size(t))*50];       % [Ah]
storage_time    = [t,ones(size(t))*12];       % [months]
temperature     = [t,ones(size(t))*25];       % [°C]
cycle_n         = [t,ones(size(t))*600];        % [n]

% Control signals
v_min           = [t,ones(size(t))*2.5];

% Launch Simulink simulation
modelName       = 'test_simulation';
siminBaseline   = Simulink.SimulationInput(modelName);
siminBaseline   = setModelParameter(siminBaseline,'StartTime','0','StopTime','30');
baseline        = sim(siminBaseline);

%Log output
out_v_batt  = baseline.v_batt;
out_ccf     = baseline.ccf;

% Plot results
plot(out_v_batt)
hold on;
plot(out_ccf)
hold on;

% Change input parameters
%current         = [t,ones(size(t))*10];        % [A]
%cycle_n         = [t,ones(size(t))*600];        % [n]
temperature     = [t,ones(size(t))*50];       % [°C]

% Launch second simulation
baseline        = sim(siminBaseline);

%Log output
out_v_batt  = baseline.v_batt;
out_ccf     = baseline.ccf;

% Plot results
plot(out_v_batt)
hold on;