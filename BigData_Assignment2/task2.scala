import org.apache.spark.sql.functions._

val input = spark.read.format("csv").option("header", "true").option("inferSchema", "true").load("github-big-data.csv")

input.registerTempTable("dataTable")

val count = spark.sql("SELECT language, SUM(stars) from dataTable GROUP BY language")

count.collect.foreach(println)
