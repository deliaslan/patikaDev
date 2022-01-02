
public class Insertion_Sort {

	public static void main(String[] args) {
		// Dizimizi tanımlıyoruz
		int[] array = { 22, 27, 16, 2, 18, 6 };
		
		insertionSort(array);
		//System.out.println(java.util.Arrays.toString(array));
	}

	// metodumuzu tanımlıyoruz.
	static void insertionSort(int[] array) {
		// döngüler içinde kaç işlem yapılıyoru kontrol amaçlı count değişkeni koydum.
		int count1 = 1;

		// tüm diziyi gezmesi için array uzunluğuna göre i değişkenimizi artıracağız.
		for (int i = 1; i < array.length; i++) {
			// for kaça kadar devam ediyor
			System.out.println("For içi: " + count1);
			count1++;
			// while içi bulma
			int count2 = 1;

			int index = i;

			//bakığımız değer eğer solundakinden küçük ise en küçük 
			//olacağı konuma kadar while döngüsünü tekrarlamasını sağlıyoruz
			while (index > 0 && array[index - 1] > array[index]) {
				//seçilen index değerini kaç adım taşıdığını saymak için kullanıyoruz.
				System.out.println("While içi: " + count2);
				count2++;
				//değer soldakinden küçükse karşılıklı yer değiştirmeyi sağlıyoruz.
				array[index] = array[index] + array[index -1 ];
				array[index -1] = array[index] - array[index-1];
				array[index] = array[index] - array[index-1];
				index--;
				System.out.println(java.util.Arrays.toString(array));
			}
		}

	}
}
