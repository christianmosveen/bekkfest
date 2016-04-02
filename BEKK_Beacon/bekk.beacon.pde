/* @pjs preload="img/bekk_beacon_kart.svg"; */
PShape kart;
Beacon_1 beacon_1;
int t, data_noise_1, module;

void setup(){
  size(ww,wh);
  background(20,19,20);

  kart = loadShape("img/bekk_beacon_kart.svg");
}

void draw(){
  background(20,19,20);
  shape(kart, width/10, (height/2)-(kart.height/1.5), width-(width/5), 0);

  beacon_1_data();
  beacon_1 = new Beacon_1(width/2,height*0.25,data_noise_1);
  beacon_1.display();

  t++;
}


class Beacon_1 {
  int radius, x, y;

  Beacon_1(_x, _y, _radius){
    radius = _radius;
    x = _x;
    y = _y;
  }

  void display(){
    noStroke();
    fill(255,0,0);
    ellipse(x, y, radius, radius);
    fill(255);
    textSize(20);
    text("1", x-6, y+5);
  }

}


void beacon_1_data(){

  //Dummy data
  noiseSeed(2);
  data_noise_1 = map(noise(t*0.01), 0, 1, 50,200);


  /* Data example

    {{beaconId: '1', dist: '7', timestamp: '17263812548'},
    {beaconId: '1', dist: '7', timestamp: '17263812548'},
    {beaconId: '1', dist: '7', timestamp: '17263812548'},
    {beaconId: '1', dist: '7', timestamp: '17263812548'},
    {beaconId: '1', dist: '7', timestamp: '17263812548'}}

    Kun de sisste */


}
