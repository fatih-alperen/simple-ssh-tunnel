# **Simple SSH Tunnel**  
A lightweight script to set up an SSH tunnel for a SOCKS proxy.  

## **Prerequisites**  
Before using this script, ensure you have:  
- A working SSH server as your proxy.  
- Your SSH key set up for authentication.  
- `proxy` configured in your SSH config file (`~/.ssh/config`).  

## **Setup Instructions**  

### **1. Configure SSH**  
Edit your SSH config file (`~/.ssh/config`) and add the following:  

```ini
Host proxy
    HostName [your-proxy-ip]
    User [your-user-name]
    IdentityFile [your-private-key-path]
```
Replace the placeholders with your actual details.  

### **2. Download and Set Up the Script**  
1. Download `proxy.sh` to your local machine.  
2. Make the script executable:  
   ```sh
   chmod +x proxy.sh
   ```

### **3. Start the Proxy**  
To start the SSH tunnel and enable the SOCKS proxy, run:  
```sh
./proxy.sh
```  

### **4. Stop the Proxy**  
To close the SSH tunnel, run:  
```sh
./proxy.sh close
```  

## **How It Works**  
- The script opens an SSH tunnel using the `proxy` configuration from your SSH config.  
- It enables a local SOCKS proxy on port `1080`.  
- You can close the tunnel by running the script with the `close` argument.  
- The tunnel runs in the background, so you can close your terminal without interrupting it.  

## **Usage with Applications**  
Once the proxy is running, configure your applications (e.g., Firefox, Chrome, or system-wide proxy settings) to use:  
- **SOCKS Host:** `127.0.0.1`  
- **Port:** `1080`  
