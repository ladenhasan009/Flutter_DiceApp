package com.example.dice_app

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
//        Setting up the button
        val rollButton: Button = findViewById(R.id.button)
        rollButton.setOnClickListener {
            it: View!
            val toast = Toast.makeTaste(context: this, text"Dice Rolled", Toast.LENGTH_SHORT).show()
            rollDice()

        }

    }

    private fun rollDice() {
        val dice = Dice( sides: 6)
        val diceRoll = dice.roll()
        val resultImageView: ImageView = findViewById(R.id.imageview)
        val image = when(diceRoll){
            1->R.drawable.dice1
            2->R.drawable.dice2
            3->R.drawable.dice3
            4->R.drawable.dice4
            5->R.drawable.dice5
            else->R.drawable.dice6 }
        resultImageView.setImageResource(image)
        resultImageView.contentDescription = dice.toString()
    }
}
class Dice(private val sides:Int){
    fun roll():Int{
        return (1..sides).random()
    }
}
