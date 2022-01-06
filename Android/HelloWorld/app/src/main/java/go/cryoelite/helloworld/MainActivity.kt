package go.cryoelite.helloworld

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.*

class MainActivity : AppCompatActivity() {
    private lateinit var resultDrawable: ImageView;

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val rollButton: Button = findViewById(R.id.roll_button)
        rollButton.setOnClickListener{diceRoll()};
        resultDrawable = findViewById(R.id.dice_image)
    }

    private fun diceRoll() {


//        val resultText: TextView = findViewById(R.id.result_text)
//        val text: String= "Rolled a ${(1..10).random()}"
//        resultText.text= text;
        val randomInt=(1..6).random();
        val drawableResource = when (randomInt) {
            1 -> R.drawable.dice_1
            2 -> R.drawable.dice_2
            3 -> R.drawable.dice_3
            4 -> R.drawable.dice_4
            5 -> R.drawable.dice_5
            else -> R.drawable.dice_6
        }
        resultDrawable.setImageResource(drawableResource)
        Toast.makeText(this, "Rolled a $randomInt",
            Toast.LENGTH_SHORT).show();
    }
}