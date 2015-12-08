within Buildings.Fluid.Movers.BaseClasses;
block Extractor
  "Extract scalar signal out of signal vector dependent on IntegerRealInput index"

  extends Modelica.Blocks.Interfaces.MISO;

  parameter Boolean allowOutOfRange=false "Index may be out of range";
  parameter Real outOfRangeValue=1e10 "Output signal if index is out of range";

  Modelica.Blocks.Interfaces.IntegerInput index             annotation (Placement(
          transformation(
          origin={0,-120},
          extent={{-20,-20},{20,20}},
          rotation=90)));
algorithm
    for i in 1:nin loop
      if index == i then
        y:=u[i];
      end if;

    end for;
  annotation (Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
            extent={{-80,50},{-40,-50}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-84.4104,1.9079},{-84.4104,-2.09208},{-80.4104,-0.09208},{
                -84.4104,1.9079}},
            lineColor={0,0,127},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Line(points={{-62,2},{-50.1395,12.907},{-39.1395,12.907}}, color={0,0,
                127}),
          Line(points={{-63,4},{-49,40},{-39,40}}, color={0,0,127}),
          Line(points={{-102,0},{-65.0373,-0.01802}}, color={0,0,127}),
          Ellipse(
            extent={{-70.0437,4.5925},{-60.0437,-4.90745}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid),
          Line(points={{-63,-5},{-50,-40},{-39,-40}}, color={0,0,127}),
          Line(points={{-62,-2},{-50.0698,-12.907},{-39.0698,-12.907}}, color={
                0,0,127}),
          Polygon(
            points={{-38.8808,-11},{-38.8808,-15},{-34.8808,-13},{-38.8808,-11}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-39,42},{-39,38},{-35,40},{-39,42}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-38.8728,-38.0295},{-38.8728,-42.0295},{-34.8728,-40.0295},
                {-38.8728,-38.0295}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-38.9983,14.8801},{-38.9983,10.8801},{-34.9983,12.8801},{-38.9983,
                14.8801}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-30,50},{30,-50}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,127}),
          Line(points={{100,0},{0,0}}, color={0,0,127}),
          Line(points={{0,2},{0,-104}}, color={255,128,0}),
          Line(points={{-35,40},{-20,40}}, color={0,0,127}),
          Line(points={{-35,13},{-20,13}}, color={0,0,127}),
          Line(points={{-35,-13},{-20,-13}}, color={0,0,127}),
          Line(points={{-35,-40},{-20,-40}}, color={0,0,127}),
          Polygon(points={{0,0},{-20,13},{-20,13},{0,0},{0,0}}, lineColor={0,0,
                127}),
          Ellipse(
            extent={{-6,6},{6,-6}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid)}),
                            Documentation(info="<html>
<p>
This model contains a custom extractor implementation. 
It needed to be created for fixing 
<a href=\"modelica://https://github.com/lbl-srg/modelica-buildings/issues/472\">issue 472</a>. 
</p>
</html>", revisions="<html>
<ul>
<li>
December 8, 2015, by Filip Jorissen:<br/>
First implementation.
This is for 
<a href=\"modelica://https://github.com/lbl-srg/modelica-buildings/issues/472\">
issue 472</a>.
</li>
</ul>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})));
end Extractor;
