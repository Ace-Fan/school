package com.thinkgem.jeesite.modules.adopens.util;

import javax.servlet.http.HttpServletRequest;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

public class GetMacAndIP2 {

    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    public String getMACAddress(String ip) {
//        String str = "";
//        String macAddress = "";
//        try {
//            Process p = Runtime.getRuntime().exec("nbtstat -A " + ip);
//            InputStreamReader ir = new InputStreamReader(p.getInputStream());
//            LineNumberReader input = new LineNumberReader(ir);
//            for (int i = 1; i < 100; i++) {
//                str = input.readLine();
//                if (str != null) {
//                    if (str.indexOf("MAC Address") > 1) {
//                        macAddress = str.substring(str.indexOf("MAC Address") + 14, str.length());
//                        break;
//                    }
//                }
//            }
//        } catch (IOException e) {
//            e.printStackTrace(System.out);
//        }
//        return macAddress;
        return new UdpGetClientMacAddr(ip).GetRemoteMacAddr();
    }

    class UdpGetClientMacAddr {
        private String sRemoteAddr;
        private int iRemotePort=137;
        private byte[] buffer = new byte[1024];
        private DatagramSocket ds=null;

        public UdpGetClientMacAddr(String strAddr) {
            sRemoteAddr = strAddr;
            try {
                ds = new DatagramSocket();
            } catch (SocketException e) {
                e.printStackTrace();
            }
        }

        protected final DatagramPacket send(final byte[] bytes) {
            DatagramPacket dp = null;
            try {
                dp = new DatagramPacket(bytes, bytes.length, InetAddress.getByName(sRemoteAddr), iRemotePort);
                ds.send(dp);
            } catch (Exception e) {

            }
            return dp;
        }

        protected final DatagramPacket receive() throws Exception {
            DatagramPacket dp = new DatagramPacket(buffer,buffer.length);
            ds.receive(dp);
            return dp;
        }

        protected byte[] getQueryCmd() throws Exception {
            byte[] t_ns = new byte[50];
            t_ns[0] = 0x00;
            t_ns[1] = 0x00;
            t_ns[2] = 0x00;
            t_ns[3] = 0x10;
            t_ns[4] = 0x00;
            t_ns[5] = 0x01;
            t_ns[6] = 0x00;
            t_ns[7] = 0x00;
            t_ns[8] = 0x00;
            t_ns[9] = 0x00;
            t_ns[10] = 0x00;
            t_ns[11] = 0x00;
            t_ns[12] = 0x20;
            t_ns[13] = 0x43;
            t_ns[14] = 0x4B;

            for(int i = 15; i < 45; i++)
            {
                t_ns[i] = 0x41;
            }

            t_ns[45] = 0x00;
            t_ns[46] = 0x00;
            t_ns[47] = 0x21;
            t_ns[48] = 0x00;
            t_ns[49] = 0x01;
            return t_ns;
        }

        protected final String getMacAddr(byte[] brevdata) {

            int i = brevdata[56] * 18 + 56;
            String sAddr="";
            StringBuffer sb = new StringBuffer(17);

            for(int j = 1; j < 7;j++)
            {
                sAddr = Integer.toHexString(0xFF & brevdata[i+j]);
                if(sAddr.length() < 2)
                {
                    sb.append(0);
                }
                sb.append(sAddr.toUpperCase());
                if(j < 6) sb.append(':');
            }
            return sb.toString();
        }

        public final void close() {
            try
            {
                ds.close();
            }
            catch (Exception ex){
                ex.printStackTrace();
            }
        }

        public final String GetRemoteMacAddr() {
            String smac;
            try {
                byte[] bqcmd = getQueryCmd();
                send(bqcmd);
                DatagramPacket dp = receive();
                smac = getMacAddr(dp.getData());
                close();
            } catch (Exception e) {
                smac = "";
            }
            return smac;
        }
    }
}


