PShape kart;
HashMap<String,Coord> beaconCoords = new HashMap<String,Coord>();

void setup(){
  size(ww,wh);
  background(20,19,20);
  console.log(width + " x " + height);

  kart = loadShape("img/bekk_beacon_kart.svg");

  Coord resepsjonen = new Coord(width/6.74,height/2.8);
  Coord youngstorget = new Coord(width/2,height/2.65);
  Coord kantina = new Coord(width/4.13,height/1.8);
  Coord fotorommet = new Coord(width/1.15, height/3.19);
  Coord fussball = new Coord(width/2.46, height/1.59);
  Coord chillout = new Coord(width/1.55, height/2.75);
  Coord retrogaming = new Coord(width/7.5, height/1.8);

  beaconCoords.put("1111", resepsjonen);
  beaconCoords.put("2222", youngstorget);
  beaconCoords.put("3333", kantina);
  beaconCoords.put("4444", fotorommet);
  beaconCoords.put("5555", fussball);
  beaconCoords.put("6666", chillout);
  beaconCoords.put("7777", retrogaming);
}

void draw(){
  background(20,19,20);
  shape(kart, width/10, (height/2)-(kart.height/1.5), width-(width/5), 0);

  if (beaconData) {
    for (int i = 0; i < beaconData.length; i++) {
      Beacon b = new Beacon(beaconData[i].beaconId, beaconData[i].dist, beaconData[i].timestamp)
      b.display();
    }
  }
}

class Beacon {
  int radius;
  String beaconId;
  long timestamp;
  Coord coord;

  Beacon(_beaconId, _dist, _timestamp) {
    beaconId = _beaconId;
    radius = _dist*15;
    coord = beaconCoords.get(beaconId);
  }

  void display() {
    if (coord) {
      noStroke();
      fill(253, 80, 88, 20);
      ellipse(coord.x, coord.y, radius, radius);
    }
  }
}

class Coord {
  int x, y;

  Coord(_x, _y) {
    x = _x;
    y = _y;
  }
}
