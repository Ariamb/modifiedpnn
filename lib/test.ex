import NN
import PNN

compilation_flag = System.argv |> Enum.at(0)#to bypass compiler auto-running code

{prog_n, _} = System.argv |> Enum.at(1) |> Integer.parse #to bypass compiler auto-running code
{m, _} = System.argv |> Enum.at(2) |> Integer.parse



alpha =  0.1


images = Matrex.load("mnistfullIMG.mtx")
labels = Matrex.load("mnistfullLAB.mtx")


IO.puts "finish loading"

nn =
        DL.input(784)
       |> DL.dense(512)
       |> DL.relu_layer()
       #|> DL.dropout(0.5)
       |> DL.dense(256)
       |> DL.relu_layer()
      # |> DL.dropout(0.5)
      #|> DL.dense(128)
      # |> DL.relu_layer()
       |> DL.dense(10)
           #   |> DL.softmax_layer()
       |> DL.mse_layer()



#WL.testSystem(m)

#{time,{newnet,_error,_acc}} = :timer.tc(&PNN.loopBatch/8,[30,230,32, 8,images, nn, labels, alpha])
#{time,{newnet,_error,_acc}} = :timer.tc(&PNN.loopBatch/8,[2,230,4,64,images,nn,labels,alpha])
{time,{newnet,_error,_acc}} = :timer.tc(&DL.loop_batch/7,[20,230, 256,images, nn, labels, alpha])

##{time,{newnet,_error,_acc}} = :timer.tc(&PNN.loopBatch/8,[2,230,4,64,images,nn,labels,alpha])
IO.puts ("time: #{time/(1_000_000)}")

{:ok, file} = File.open("timer.txt", [:append])
IO.binwrite(file, "programa1 #{time} #{m} #{prog_n}\n")
