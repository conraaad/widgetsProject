import 'package:flutter/material.dart';
import 'package:widgets_project/themes/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
   
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

  final List<int> imageIds = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    //scrollController.position.pixels => posicio actual del scroll
    //scrollController.position.maxScrollExtent => posicio maxima que es pot estirar el content
    scrollController.addListener(() {
      //print('${scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}');
      if (scrollController.position.pixels + 500 >= scrollController.position.maxScrollExtent) fetchData();
    });
  }

  //cada crida d'aquest metode afegim 5 fotos a la nostra llista 
  void add5() {
    final lastId = imageIds.last;
    for (int i = 0; i < 5; i++) {
      imageIds.add(lastId + i);
    }
    setState(() {});
  }

  //creem un future que serveixi per simular que fem una peticio http
  Future fetchData() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    add5();

    isLoading = false;
    setState(() {});

    //si no estem a baix de tot del scroll no farem res
    if (scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    //pero si estem al final farem un lleu desplaçament cap avall per deixar veure que hi ha mes contingut carregat
    scrollController.animateTo(
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imageIds.last;
    imageIds.clear();
    imageIds.add(lastId + 1);
    add5();
  }

  @override
  Widget build(BuildContext context) {

    //Aqui obtenim molta informacio del dispositiu en que estem corrent la app
    //en aquest cas estem prenen l'amplada i alçada que te el dispositiu
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //serveix per eliminar l'espai de dalt on hi ha la barra de notificacions
      backgroundColor: Colors.grey.shade800,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        //Stack es com column o row, pero posa el seu children un sobre l'altre => molt util per un loading per ex
        child: Stack(
          children: [
            
            //refreshIndicator es el pull to refresh, necessita un future 

            RefreshIndicator(
              onRefresh: onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,   //controlador per saber on estem en el scroll de la pagina
                itemCount: imageIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/loading_Blue.gif'), 
                    image: NetworkImage('https://picsum.photos/500/300?image=${imageIds[index]}')
                  );
                },
              ),
            ),

            if (isLoading)

              Positioned(
                bottom: 40,
                left: size.width * 0.5 - 30,
                child: const LoadingIcon()
              ),

          ],
        ),
      ),
    );
  }
}

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        shape: BoxShape.circle
      ),
      child: const CircularProgressIndicator(color: AppTheme.mainColor,),
    );
  }
}