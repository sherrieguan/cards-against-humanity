import processing.serial.*;

Serial myPort;  // Create object from Serial class
String newTag;     // Data received from the serial port

void setup(){ 
  String blackCards[] = {
  "\n_________________\nis the universe's way of telling me I should stay away from\n_________________.\n",
  "For my next trick, I will pull \n_________________\nout of \n_________________.\n",
  "I drink to forget \n_________________.\n",
  "Step 1: \n_________________.\nStep 2: \n_________________.\nStep 3: Profit.",
  "Why do I hurt all over? \n_________________\nis \n_________________.\n",
  "When I was tripping on acid, \n_________________\nturned into \n_________________\n",
  "That’s right, I killed \n_________________.\nHow, you ask? \n_________________.\n",
  };
  size(360, 640);
  background(0);
  noStroke();
  textSize(24);
  int index = int(random(blackCards.length));
  text(blackCards[index], 30, 60, 300, 600); 
  rect(30, 400, 130, 200, 7);
  fill(255);
  rect(200, 400, 130, 200, 7);
  fill(255);
  //rect(90, 300, 180, 60, 7);
  // I know that the first port in the serial list on my mac
  // is Serial.list()[4].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[4]; //change the 0 to a 1 or 2 etc. to match your port
  printArray(Serial.list());
  myPort = new Serial(this, portName, 9600);

}
  String whiteCards[] = {
    "poor life choices",
    "my sex life",
    "puppies",
    "hormone injections",
    "Asians who aren't good at math",
    "doing it in the butt",
    "me time",
    "Harry Potter erotica"
  };
  

void draw() {
  //fill(80);
  //textSize(18);
  //text("refresh", 148, 318, 100, 130);
  if ( myPort.available() > 0) {  // If data is available,
    newTag = myPort.readStringUntil('\n');         // read it and store it in val
    if ( newTag != null) {
      println(newTag); //print it out in the console

      String[] list = split(newTag, ',');
      String reader = list[0];
      String id = list[1];
      if (reader.contains("1")){
        if (id.contains("5400D26D47AC")) {
          fill(0);
          textSize(16);
          text(whiteCards[0], 50, 420, 100, 130);
        }
        if (id.contains("1A0022984EEE")) {
          fill(0);
          textSize(16);
          text(whiteCards[1], 50, 420, 100, 130);
        }
        if (id.contains("1A00226AB7E5")) {
          fill(0);
          textSize(16);
          text(whiteCards[2], 50, 420, 90, 100);
        }
        if (id.contains("5400D25FE831")) {
          fill(0);
          textSize(16);
          text(whiteCards[3], 50, 420, 100, 130);
        }
      }
      if (reader.contains("2")){
        if (id.contains("5400D26D47AC")) {
          fill(0);
          textSize(16);
          text(whiteCards[4], 215, 420, 100, 130);
        }
        if (id.contains("1A0022984EEE")) {
          fill(0);
          textSize(16);
          text(whiteCards[5], 215, 420, 100, 130);
        }
        if (id.contains("1A00226AB7E5")) {
          fill(0);
          textSize(16);
          text(whiteCards[6], 215, 420, 100, 130);
        }
        if (id.contains("5400D25FE831")) {
          fill(0);
          textSize(16);
          text(whiteCards[7], 215, 420, 100, 130);
        }
      }
    }
  }
}
