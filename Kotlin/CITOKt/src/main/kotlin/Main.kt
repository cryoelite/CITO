import kotlinx.coroutines.*
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import com.google.gson.Gson

//fun main() = runBlocking {
//    val channel = Channel<String>()
//    launch { sendString(channel, "foo", 200L) }
//    launch { sendString(channel, "BAR!", 500L) }
//    repeat(6) { // receive first six
//        println(channel.receive())
//    }
//    coroutineContext.cancelChildren() // cancel all children to let main finish
//}
//
//suspend fun sendString(channel: SendChannel<String>, s: String, time: Long) {
//    while (true) {
//        delay(time)
//        channel.send(s)
//    }
//}

fun main()= runBlocking{



    val url = URL("https://technowolf.in/phishingDomains")
    val conn = withContext(Dispatchers.IO) {
        url.openConnection() as HttpURLConnection
    }
    conn.requestMethod="GET"
    var phishingDomains: String = ""
    BufferedReader(InputStreamReader(conn.inputStream)).use { br ->
        var line: String?
        while (br.readLine().also { line = it } != null) {
            phishingDomains+= line
        }
    }
    val gsonResult= Gson().fromJson<Domains>(phishingDomains, Domains::class.java)

    val message= "https://www.101nitro.com/aaa";

    val domainRegex = Regex("^(?!-)[A-Za-z0-9-]+([\\-\\.]{1}[a-z0-9]+)*\\.[A-Za-z]{2,6}$")
    gsonResult.domains.filter { message.contains(it)}.let {
        println(it.isEmpty());
        println(it);

    }
    gsonResult.domains.filter { message.contains(it) && domainRegex.matches(message)}.let {
        println(it.isEmpty());
        println(it);

    }


}

data class Domains(var domains: List<String>) {
    fun print() {
        domains.forEach(

        )  {
            println(it);
        }
    }
}

