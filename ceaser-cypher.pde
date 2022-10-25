String password = "abcdef";
String input;
int[] passwor = new int[password.length()];
int ccypher = 13;
String vcipher = "aaaaaaaa";
Boolean cypher = false;
Boolean encryptedState = false;
String output = "";
void setup() {
  size(550, 300);
  textSize(20);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(0);
  stroke(#16C60C);
  fill(0);
  rect(100, 100, 100, 100);
  rect(350, 100, 100, 100);
  rect(225, 100, 100, 50);
  rect(100, 25, 350, 50);
  rect(100, 225, 350, 50);
  fill(#16C60C);
  text("Password: " + password, 275, 50 );
  text("ENCRYPT", 150, 145);
  text("DECRYPT", 400, 145);
  text("CLEAR", 275, 125);
  if (!encryptedState) {
    text(output, width/2, 250);
  } else {
    text(output, width/2, 250);
  }


  /*background(0);
   textSize(20);
   text("Password: "+password, 10, 20);
   text("Caeser cipher: "+caeser(), 10, 50);
   text("Vegenere cipher: "+vigenere(), 10, 70);
   text("Caeser key: "+ccypher+"\n"+"Vegenere key: "+vcipher+"\n"+input, 10, 100);
   rect(textWidth("Caeser key: "+ccypher)+20, 100-textAscent(), 30, 30);
   rect(textWidth("Caeser key: "+ccypher)+60, 100-textAscent(), 30, 30);*/
}



void mousePressed() {
 
}


String vigenere() {
  String lower = "abcdefghijklmnopqrstuvwxyz";
  String upper = lower.toUpperCase();
  String Alphabet = lower;
  input = vcipher;
  if (vcipher.length()!=0) {
    while (26>input.length()) {
      input += vcipher;
    }
    input = input.substring(0, 26);
  }
  String output = "";
  for (int x = 0; x<password.length(); x++) {
    for (int i = 0; i<input.length(); i++) {
      if (lower.indexOf(password.charAt(x))==-1) {
        Alphabet = upper;
        input = input.toUpperCase();
      } else {
        Alphabet = lower;
        input = input.toLowerCase();
      }
      if (password.charAt(x)==Alphabet.charAt(i)) {
        int temp = x;
        while (temp>25) {
          temp += -26;
        }
        int forskyd = Alphabet.indexOf(input.charAt(temp));
        if (i+forskyd>25) {
          output += Alphabet.charAt(i+forskyd-26);
        } else if (i+forskyd<0) {
          output += Alphabet.charAt(i+forskyd+26);
        } else if (forskyd==(-1)) {
          output += input.charAt(x);
        } else {
          output += Alphabet.charAt(i+forskyd);
        }
      }
    }
  }
  return output;
}

String caeser() {
  passwor = new int[password.length()];
  String lower = "abcdefghijklmnopqrstuvwxyz";
  String upper = lower.toUpperCase();
  String Alphabet = lower;
  String output = "";

  for (int x = 0; x<password.length(); x++) {
    for (int i = 0; i<Alphabet.length(); i++) {
      if (lower.indexOf(password.charAt(x))==-1) {
        Alphabet = upper;
      } else {
        Alphabet = lower;
      }
      if (password.charAt(x)==Alphabet.charAt(i)) {

        if (i+ccypher>25) {
          passwor[x] = Alphabet.charAt(i+ccypher-26);
        } else if (i+ccypher<0) {
          passwor[x] = Alphabet.charAt(i+ccypher+26);
        } else {
          passwor[x] = Alphabet.charAt(i+ccypher);
        }
      }
    }
  }

  for (int i = 0; i< password.length(); i++) {
    if (passwor[i]==0) {
      output += ' ';
    } else {
      output += char(passwor[i]);
    }
  }

  return output;
}

void keyPressed() {
  if (!cypher) {
    //  lånt fra processing.org/examples/charactersstrings.html
    //gendkender alle ascii tegn mellem '!' og 'z', plus mellemrum
    textSize(20);
    if ((key >= '!' && key <= 'z'|| key == ' '||key >= 128 && key <= 255)&&textWidth(password)+textWidth("Password: ")<width-20&&textWidth(caeser())+textWidth("Caeser cipher: ")<width-20&&textWidth(vigenere())+textWidth("Vegenere cipher: ")<width-20) {  // 12865

      password = password + key;
      // lånt kode slutter
    } else if (key==BACKSPACE) {  //   opsummering: delete key
      try {
        // .substring kopiere password, og fjern karaktere fra begyndelse og/eller slutningen
        // .length returnere mængden af karaktere i dets string som int. vi minuser med 1, for at slette et tegn
        password = password.substring(0, password.length()-1);
      }
      catch(StringIndexOutOfBoundsException e) {  // hvis det ville give den error message out of bounds
      }
    }
  } else {

    //  lånt fra processing.org/examples/charactersstrings.html
    //gendkender alle ascii tegn mellem '!' og 'z', plus mellemrum
    textSize(20);
    if ((key >= '!' && key <= 'z'|| key == ' '||key >= 128 && key <= 255)&&textWidth(vcipher)+textWidth("Password: ")<width-20) {  // 12865

      vcipher = vcipher + key;
      // lånt kode slutter
    } else if (key==BACKSPACE) {  //   opsummering: delete key
      try {
        // .substring kopiere password, og fjern karaktere fra begyndelse og/eller slutningen
        // .length returnere mængden af karaktere i dets string som int. vi minuser med 1, for at slette et tegn
        vcipher = vcipher.substring(0, vcipher.length()-1);
      }
      catch(StringIndexOutOfBoundsException e) {  // hvis det ville give den error message out of bounds
      }
    }
  }
}
