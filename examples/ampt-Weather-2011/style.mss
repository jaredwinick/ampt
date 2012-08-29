Map {
  background-color: #111;
}

#countries {
  ::outline {
    line-color: #555;
    line-width: 2;
    line-join: round;
  }
  polygon-fill: #333;
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

#2011hail [timestamp>%d][timestamp<%d]{
  [sz>=0.75]{ marker-width:2; }
  [sz>=1.25]{ marker-width:4; }
  [sz>=1.75]{ marker-width:6; }
  [sz>=2.25]{ marker-width:8; }
  [sz>=2.75]{ marker-width:10; }
  marker-fill:#fff;
  marker-line-color:#eee;
  marker-allow-overlap:true;
  marker-opacity:.2;
  marker-line-opacity:.2;
}


#2011torn [timestamp>%d][timestamp<%d]{
  marker-width:1;
  [f>=1]{ marker-width:2;}
  [f>=2]{ marker-width:4;}
  [f>=3]{ marker-width:6;}
  [f>=4]{ marker-width:8;}
  [f>=5]{ marker-width:10;}
  marker-fill:#f45;
  marker-line-color:#813;
  marker-allow-overlap:true;
  marker-opacity:.4;
  marker-line-opacity:.4;
}
