package go.cryoelite.aboutme

import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.*

class MainActivity : AppCompatActivity() {
    lateinit var editText: EditText;
    lateinit var nickTextView: TextView;
    lateinit var doneButton: Button;

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        editText = findViewById<EditText>(R.id.nickname_edit)
        nickTextView = findViewById<TextView>(R.id.nickname_text)
        doneButton = findViewById<Button>(R.id.done_button)
        doneButton.setOnClickListener {
            clickHandler(it);
        };
        nickTextView.setOnClickListener{
            updateNick(it);
        };
    }

    private fun updateNick(clickedView: View){

        editText.visibility=View.VISIBLE;
        doneButton.visibility=View.VISIBLE;
        editText.text.clear();
        editText.text.append(nickTextView.text);
        nickTextView.text="";
        nickTextView.visibility=View.GONE;

        editText.requestFocus();
        val imm = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
        imm.showSoftInput(editText, 0)
    }

    private fun clickHandler(clickedView: View) {
        val text= editText.text.toString();
        if(text!= "" && text!= " ")
        {
            nickTextView.text=text;
            editText.visibility=View.GONE;
            doneButton.visibility=View.GONE;
            nickTextView.visibility=View.VISIBLE;
            val inputMethodManager = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
            inputMethodManager.hideSoftInputFromWindow(clickedView.windowToken, 0)
        }

    }
}