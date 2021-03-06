import org.apache.spark.sql.functions._

val input = spark.read.format("csv").option("header", "true").option("inferSchema", "true").load("github-big-data.csv")

input.registerTempTable("dataTable")

val highest = spark.sql("SELECT * from dataTable WHERE stars=(SELECT stars from dataTable ORDER BY stars DESC LIMIT 1)")

highest.collect.foreach(println)


