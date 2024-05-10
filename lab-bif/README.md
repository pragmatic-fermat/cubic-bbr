
D'abord listez les conversations TCP du pcap X avec ```tshark```

```tshark -r assignment2.pcap -q -z conv,tcp```

Puis, utilisez le script bytes-in-flight.sh pour analyser les connexions présentes dans le pcap nommé X

```
Usage:
   bytes-in-flight.sh FILE SND-IP SND-PORT DST-IP DST-PORT                   OUTPUT-FILE
      FILE is the name of the trace file to be analyzed
      SND-IP is the IP address of the host sending data
      SND-PORT is the TCP Port number sending data
      DST-IP is the IP address of the host receiving data
      DST-PORT is the TCP Port number receiving data
      OUTPUT-FILE is the name of the output file
```

PS : ces scripts sont extraits de :
- [https://github.com/noahdavids/packet-analysis.git](https://github.com/noahdavids/packet-analysis.git)
- [https://github.com/pkpraveen895/pcap-analyser.git](https://github.com/pkpraveen895/pcap-analyser.git)
