import org.apache.spark.sql.functions._

val input = spark.read.format("csv").option("header", "true").option("inferSchema", "true").load("github-big-data.csv")

input.flatMap(row => row(1).toString().split(" ")).map(word => (word,1)).rdd.reduceByKey(_+_).sortBy(-_._2).first()
