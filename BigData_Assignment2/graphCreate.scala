import org.apache.spark._
import org.apache.spark.rdd.RDD
import org.apache.spark.graphx._
import org.apache.spark.graphx.lib.ShortestPaths


val input = spark.read.format("csv").option("header", "true").option("inferSchema", "true").load("dblp_coauthorship.csv").rdd

val data = input.map(word => (word(0).toString(), word(1).toString())) 


val inputRDD = data.flatMap(x => List(x._1, x._2)).distinct.zipWithIndex

val inputMap = inputRDD.collect.toMap

val vertices = inputRDD.map(p => (p._2, p._1))

val edge = data.map(x => Edge(inputMap(x._1), inputMap(x._2), ""))

val graph = Graph(vertices, edge, "nothing")




val paths = ShortestPaths.run(graph, List(inputMap("Paul Erdös")))

val numbers = paths.vertices.map(x => (x._1, x._2(1449)))

val joinedMap = vertices.join(numbers)

val sortedJoinedMap = joinedMap.sortBy(-_._2._2)

val biggest = sortedJoinedMap.first
