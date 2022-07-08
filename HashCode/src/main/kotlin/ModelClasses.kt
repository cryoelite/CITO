import java.util.ArrayList

class skill(var name: String, var level: Int)
class contributors(var name: String, skillList: ArrayList<skill>) {
    var skillList: List<skill>

    init {
        this.skillList = skillList
    }
}

class project {
    var name: String? = null
    var daysToComplete = 0
    var scoreRewarded = 0
    var bestBeforeDays = 0
    var roles = 0
    var requiredSkills: List<skill>? = null
}

class assignment {
    var contributorsList: List<contributors>? = null
    var projectList: List<project>? = null
}