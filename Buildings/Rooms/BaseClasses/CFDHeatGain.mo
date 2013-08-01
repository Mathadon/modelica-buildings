within Buildings.Rooms.BaseClasses;
model CFDHeatGain "Model to convert internal heat gain signals"
  extends Buildings.BaseClasses.BaseIcon;

  parameter Modelica.SIunits.Area AFlo "Floor area";

  Modelica.Blocks.Interfaces.RealInput qGai_flow[3]
    "Radiant, convective and latent heat input into room (positive if heat gain)"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput QGai_flow[3](unit="W")
    "Radiant, convective and latent heat input into room (positive if heat gain)";

equation
  QGai_flow = AFlo .* qGai_flow;

 annotation(Documentation(info="<html>
This model computes the radiant, convective and latent heat flow.
Input into this model are these three components in units of [W/m2].
The inputs need to be positive quantities if heat or moisture is added
to the room.
The outputs are 
<ul>
<li>
the radiant heat flow in Watts,
</li>
<li>
the convective heat flow in Watts, and
</li>
<li>
the water vapor released into the air.
</li>
</ul>
</html>",
        revisions="<html>
<ul>
<li>
August 1, 2013, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"), Icon(graphics={
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
        Line(
          points={{-48,-66},{-24,-18},{0,-68}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-24,-18},{-24,46}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-52,24},{-24,38}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-24,38},{8,22}},
          color={0,0,255},
          smooth=Smooth.None),
        Ellipse(extent={{-40,76},{-8,46}},  lineColor={0,0,255}),
        Text(
          extent={{-98,30},{-38,-26}},
          lineColor={0,0,127},
          textString="q_flow"),
        Text(
          extent={{12,72},{86,50}},
          lineColor={0,0,127},
          textString="QRad_flow"),
        Text(
          extent={{10,12},{84,-10}},
          lineColor={0,0,127},
          textString="QCon_flow"),
        Text(
          extent={{12,-46},{86,-68}},
          lineColor={0,0,127},
          textString="mLat_flow")}),
        Documentation(info = "<html>
This is a dummy model that is required to implement the room
model with a variable number of surface models.
The model is required since arrays of models, such as used for the surfaces
that model the construction outside of the room, 
must have at least one element, unless the whole array
is conditionally removed if its size is zero.
However, conditionally removing the surface models does not work in this
situation since some models, such as for computing the radiative heat exchange
between the surfaces, require access to the area and absorptivity of the surface models.

</html>",
        revisions="<html>
<ul>
<li>
February 22, by Michael Wetter:<br/>
Improved the code that searches for the index of 'water' in the medium model.
</li>
<li>
June 8 2010, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"),
    Diagram(graphics));
end CFDHeatGain;
