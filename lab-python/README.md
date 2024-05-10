Analyse avec python


QUestions :
a)  Count the number of TCP flows initiated from the sender
b) For each TCP flow 
   - For the first 2 transactions after the TCP connection is set up (from sender to receiver), get the values of the Sequence number, Ack number, and Receive Window size. Explain these values.
   - Compute the throughput for data sent from source to destination. To estimate throughput count all data and headers. You need to figure out how to define throughput in terms of what you are including as part of the throughput estimation. 
   - Compute the loss rate for each flow. Loss rate is the number of packets not received divided by the number of packets sent. Loss rate is an application layer metric. So think about what makes sense when defining loss rate. 
   - Estimate the average RTT. Now compare your empirical throughput from (b) and the theoretical throughput (estimated using the formula derived in class). Explain your comparison.

```
python analysis_pcap_tcp_B.py ./assignement2.pcap
```
