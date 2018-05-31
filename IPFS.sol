<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- loading the minified version -->
    <script src="https://unpkg.com/ipfs-api/dist/index.min.js"></script>

    <!-- loading the human-readable (not minified) version -->
    <script src="https://unpkg.com/ipfs-api/dist/index.js"></script>
    <script src="buffer.js" ></script>
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div>
            <input type="file" id="file" value="file" />
            <button onclick="fileAdd();">IPFS</button>
        </div>
    </div>
</body>
<script>
    const ipfs = window.IpfsApi('ipfs.infura.io', '5001',{"protocol": 'https'})

    function fileAdd() {
        const file = document.getElementById("file").files[0];
        let reader = new window.FileReader()
        reader.readAsArrayBuffer(file)

         reader.onload = function(event) {
                const buf = buffer.Buffer(reader.result);
                ipfs.files.add(buf,function(err,ipfsHash) {
                    if(!err)
                    {
                        console.log(ipfsHash);
                    }
                    else{
                        console.log(err);
                    }
                        

            // ipfs.add(reader,function(err, ipfsHash){
            //     console.log(ipfsHash);
            // });
         });
        }
    }
</script>
</html>
