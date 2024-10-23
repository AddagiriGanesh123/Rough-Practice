import java.util.Arrays;
public class nearest {
    public static void main(String[] args) {
        int[] arr={7,9,5};
        int[] result=new int[arr.length];
        for (int i = 0; i < result.length; i++) {
            int difference=Integer.MAX_VALUE;
            int nearest=arr[i];
            for (int j = 0; j < result.length; j++) {
                if(i==j){
                    continue;
                }
                int temp=Math.abs(arr[i]-arr[j]);
                if(temp<difference){
                    difference=temp;
                    nearest=arr[j];
                }
                else if(temp==difference){
                    nearest =(nearest+arr[j])/2;
                }
                
            }
            result[i]=nearest;
        }
        System.out.print(Arrays.toString(result));
    }
}
