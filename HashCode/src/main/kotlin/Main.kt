import java.util.Scanner

fun main(args: Array<String>) {
    val assignmentInp=getInput()
}
fun getInput(): assignment {
    var input= listOf<String>()
    val delim = ' '
   input= readln().split(delim)
    val projectsInp = input[0].toInt()

    val contributorsInp = input[1].toInt()
    val contributorsList = arrayListOf<contributors>()

    val projectList = arrayListOf<project>()

    repeat(contributorsInp)
    {
        input = readln().split(delim)
        val name = input[0]
        val skillsTemp = arrayListOf<skill>()
        val skillCount = input[1].toInt()
        repeat(skillCount)
        {
            input = readln().split(delim)
            val tempSkill = skill(input[0], input[1].toInt())
            skillsTemp.add(tempSkill)
        }
        val tempContributor = contributors(name, skillsTemp)
        contributorsList.add(tempContributor)
    }

    repeat(projectsInp) {
        input = readln().split(delim)
        val name = input[0]
        val dayLimit = input[1].toInt()
        val score = input[2].toInt()
        val bestBeforeDay = input[3].toInt()
        val roles = input[4].toInt()
        val skillsTemp = arrayListOf<skill>()

        repeat(roles)
        {
            input = readln().split(delim)
            val tempSkill = skill(input[0], input[1].toInt())
            skillsTemp.add(tempSkill)
        }

        val tempProject = project()
        tempProject.name = name
        tempProject.daysToComplete = dayLimit
        tempProject.scoreRewarded = score
        tempProject.bestBeforeDays = bestBeforeDay
        tempProject.roles = roles
        tempProject.requiredSkills = skillsTemp

        projectList.add(tempProject)
    }

    val assignmentInp = assignment()
    assignmentInp.contributorsList = contributorsList
    assignmentInp.projectList = projectList

    return assignmentInp


}

