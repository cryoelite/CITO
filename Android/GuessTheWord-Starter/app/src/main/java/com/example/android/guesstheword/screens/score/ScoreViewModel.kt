package com.example.android.guesstheword.screens.score

import android.util.Log
import androidx.lifecycle.ViewModel

class ScoreViewModel(var score: Int): ViewModel() {

    init {
        Log.i("ScoreViewModel", "Final score is $score");

    }
}