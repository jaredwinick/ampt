Map {
  background-color: #111;
}

#countries {
  ::outline {
    line-color: #333;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: #222;
}

#10madmin1statesprovi {
    line-color: #555;
    line-width: .2;
    line-join: round;
}

#lakes  [ScaleRank<=1]{
  line-color:#111;
  line-width:0.5;
  polygon-opacity:1;
  polygon-fill:#111;
}

#tweets [timestamp>%d][timestamp<%d]{
  marker-width:2;
  marker-fill:#fb5;
  marker-opacity:0.05;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}
