within Buildings.Fluid.Movers.Validation.BaseClasses;
model Extractor "Example of extractor block"
  Buildings.Fluid.Movers.BaseClasses.Extractor extractor(nin=2)
    "Custom implementation of extractor"
    annotation (Placement(transformation(extent={{-20,20},{0,0}})));
  Modelica.Blocks.Sources.Cosine cosine(freqHz=10) "Cosine input function"
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  Modelica.Blocks.Sources.Ramp ramp(duration=1) "Ramp input function"
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
  Modelica.Blocks.Sources.IntegerExpression integerExpression(y=if mod(sin(time),
        0.5) > 0.2 then 2 else 1)
    "Somewhat complicated condition for determining switching period"
    annotation (Placement(transformation(extent={{-60,50},{-40,70}})));
  Modelica.Blocks.Routing.Extractor extractorMSL(nin=2, index(fixed=true,start=0))
    "MSL implementation of extractor"
    annotation (Placement(transformation(extent={{-20,-18},{0,-38}})));
equation
  connect(ramp.y, extractor.u[2]) annotation (Line(points={{-59,-30},{-30,-30},
          {-30,9},{-22,9}}, color={0,0,127}));
  connect(cosine.y, extractor.u[1])
    annotation (Line(points={{-59,10},{-22,10},{-22,11}}, color={0,0,127}));
  connect(integerExpression.y, extractor.index)
    annotation (Line(points={{-39,60},{-10,60},{-10,22}}, color={255,127,0}));
  connect(extractorMSL.index, extractor.index)
    annotation (Line(points={{-10,-16},{-10,3},{-10,22}}, color={255,127,0}));
  connect(extractorMSL.u, extractor.u)
    annotation (Line(points={{-22,-28},{-22,10}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),
    Documentation(revisions="<html>
<ul>
<li>
December 8, 2015, by Filip Jorissen:<br/>
First implementation.
This is for issue 
<a href=\"modelica://https://github.com/lbl-srg/modelica-buildings/issues/472\">
issue 472</a>.
</li>
</ul>
</html>", info="<html>
<p>This model demonstrates a custom extractor implementation.
It needed to be created for fixing
<a href=\"modelica://https://github.com/lbl-srg/modelica-buildings/issues/472\">
issue 472</a>.
</p>
</html>"),
    __Dymola_Commands(file=
          "Resources/Scripts/Dymola/Fluid/Movers/Examples/BaseClasses/Extractor.mos"
        "Simulate and plot"));
end Extractor;
