within Buildings.Fluid.Movers.Data;
record Generic "Generic data record for pumps and fans"
  extends Modelica.Icons.Record;
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm
    N_nominal=1500 "Nominal rotational speed for flow characteristic";
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm N_min=0.0
    "Minimum rotational speed. Fixme. Check how this is used";
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm N_max=1e15
    "Maximum rotational speed";
  parameter Buildings.Fluid.Movers.BaseClasses.Characteristics.flowParameters
    pressure(V_flow={0.5, 1}, dp={2,1})
    "Volume flow rate vs. total pressure rise"
    annotation(Evaluate=true);
  parameter
    Buildings.Fluid.Movers.BaseClasses.Characteristics.efficiencyParameters
    hydraulicEfficiency(r_V={1}, eta={0.7}) "Hydraulic efficiency";
  parameter
    Buildings.Fluid.Movers.BaseClasses.Characteristics.efficiencyParameters
    motorEfficiency(r_V={1}, eta={0.7}) "Electric motor efficiency";
  parameter Buildings.Fluid.Movers.BaseClasses.Characteristics.powerParameters
    power(V_flow={1}, P={1})
    "Volume flow rate vs. electrical power consumption";
  parameter Boolean motorCooledByFluid=true
    "If true, then motor heat is added to fluid stream";
  parameter Boolean use_powerCharacteristic=false
    "Use powerCharacteristic instead of efficiencyCharacteristic";
  annotation (Documentation(revisions="<html>
<ul>
<li>June 16, 2014 by Michael Wetter:<br/>
Set <code>Evaluate=true</code> annotation for <code>pressure</code> to avoid
the translation warning
<pre>
The parameter per.pressure.V_flow has some elements
per.pressure.V_flow[2]

which were fixed to constants,
since they control structural properties such as sizes of arrays.
</pre>
See <a href=\"https://github.com/lbl-srg/modelica-buildings/issues/209#issuecomment-46109021\">
https://github.com/lbl-srg/modelica-buildings/issues/209#issuecomment-46109021</a>.
</li>
<li>April 17, 2014
    by Filip Jorissen:<br/>
       Initial version.
</li>
</ul>
</html>", info="<html>
<p>
Record containing parameters from real pumps or fans. Parameters can be typically found in data sheets. 
</p>
<p>
<br>An example can be found in:
<a href=\"modelica://Buildings.Fluid.Movers.Examples.FlowMachine_Nrpm_Data\">
Buildings.Fluid.Movers.Examples.FlowMachine_Nrpm_Data
</a>
</p>
</html>"));
end Generic;