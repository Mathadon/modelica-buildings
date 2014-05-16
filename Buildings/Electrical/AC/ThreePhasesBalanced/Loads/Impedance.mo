within Buildings.Electrical.AC.ThreePhasesBalanced.Loads;
model Impedance "Model of a resistive load"
  extends Buildings.Electrical.Interfaces.PartialImpedance(
    redeclare package PhaseSystem = PhaseSystems.OnePhase,
    redeclare Interfaces.Terminal_n terminal);

  parameter Boolean star = true
    "Type of load connection: true = star, false = triangle" annotation(Evaluate=true, choices(
      choice=true "Star",
      choice=false "Triangle",
      __Dymola_radioButtons=true));
protected
  Modelica.SIunits.AngularVelocity omega;
  Modelica.SIunits.Reactance X(start = 1);
equation
  omega = der(PhaseSystem.thetaRef(terminal.theta));

  // Inductance of each line
  if inductive then
    X = omega*L_;
  else
    X = -1/(omega*C_);
  end if;

  // Ohm's law
  if star then
    terminal.v = {{R_,-X}*terminal.i, {X,R_}*terminal.i};
  else
    terminal.v = {{R_/3,-X/3}*terminal.i, {X/3,R_/3}*terminal.i};
  end if;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
            lineColor={255,255,255}),
          Rectangle(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
          origin={7.10543e-15,7.10543e-15},
          rotation=180),
          Line(points={{-6.85214e-44,-8.39117e-60},{12,1.46953e-15}},
                                       color={0,0,0},
          origin={-80,0},
          rotation=180),
        Text(
          extent={{-120,-80},{120,-120}},
          lineColor={0,120,120},
          textString="%name"),
        Rectangle(
          extent={{-11,30},{11,-30}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={2,49},
          rotation=90),
        Rectangle(
          extent={{-11,30},{11,-30}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={2,1},
          rotation=90),
        Rectangle(
          extent={{-11,30},{11,-30}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          origin={2,-49},
          rotation=90),
        Line(
          points={{52,50},{68,0},{52,-50}},
          color=DynamicSelect({0,0,0}, if star then {0,0,0}
               else {255,255,255}),
          smooth=Smooth.None),
        Line(
          points={{68,0},{52,0}},
          color=DynamicSelect({0,0,0}, if star then {0,0,0} else {255,255,255}),
          smooth=Smooth.None),
        Line(
          points={{-68,50},{-28,50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-68,0},{-28,0}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{-68,-50},{-28,-50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{32,50},{52,50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{32,0},{52,0}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{32,-50},{52,-50}},
          color={0,0,0},
          smooth=Smooth.None),
        Line(
          points={{52,50},{52,36},{-50,14},{-50,0}},
          color=DynamicSelect({0,0,0}, if not star then {0,0,0}
               else {255,255,255}),
          smooth=Smooth.None),
        Line(
          points={{52,0},{52,-14},{-50,-36},{-50,-50}},
          color=DynamicSelect({0,0,0}, if not star then {0,0,0}
               else {255,255,255}),
          smooth=Smooth.None),
        Line(
          points={{52,-50},{72,-50},{72,68},{-50,68},{-50,50}},
          color=DynamicSelect({0,0,0}, if not star then {0,0,0}
               else {255,255,255}),
          smooth=Smooth.None)}),
          Documentation(info="<html>
<p>
Model of a load that is characterized by its resistance, 
inductance or capacitance.
</p>
<p>
If <code>inductive=true</code>, then the
inductance is a parameter, otherwise
the capacitance is a parameter.
The parameter <code>star</code> is used to 
configure the model as a star or triangle circuit.
</p>
</html>", revisions="<html>
<ul>
<li>
January 2, 2012, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end Impedance;