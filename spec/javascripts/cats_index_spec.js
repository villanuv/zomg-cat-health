describe("Cats Index page", function() {

  it("displays all cats with displayCats function", function() {
    loadFixtures("cats_index.html");
    expect($('table tbody')).toContainText('wide-eyed and worried kitten');
    expect($('table tbody')).toContainText('furry kitten as grumpy cat');
    expect($('table tbody')).toContainText('sad kitty, poor kitty');
    expect($('table tbody')).toContainText('this cat is sorry for something');
    expect($('table tbody')).toContainText('Pikachu! Meow?'); 
  });

  it("sorts cats with most 'zomg' votes by calling dataSort(0, 'omg') once", function() {
    loadFixtures("cats_index.html");
    dataSort(0, 'zomg');
    expect(cats[0]).toEqual({id: '3', url: 'https://s-media-cache-ak0.pinimg.com/736x/41/ae/de/41aedefbf1961350e3e3df81d723dfac.jpg', description: 'sad kitty, poor kitty', zomg: '5', amazing: '0'});
  });

  it("reverse sorts cats with most 'zomg' votes by calling dataSort(0, 'omg') twice", function() {
    loadFixtures("cats_index.html");
    dataSort(0, 'zomg');
    cats.reverse();
    expect(cats[4]).toEqual({id: '3', url: 'https://s-media-cache-ak0.pinimg.com/736x/41/ae/de/41aedefbf1961350e3e3df81d723dfac.jpg', description: 'sad kitty, poor kitty', zomg: '5', amazing: '0'});
  });

  it("sorts cats with most 'amazing' votes by calling dataSort(1, 'amazing') once", function() {
    loadFixtures("cats_index.html");
    dataSort(1, 'amazing');
    expect(cats[0]).toEqual({id: '5', url: 'https://s-media-cache-ak0.pinimg.com/originals/6b/45/5d/6b455d864ecce4270da03f9ff008736b.jpg', description: 'Pikachu! Meow?', zomg: '0', amazing: '5'});
  });

  it("reverse sorts cats with most 'amazing' votes by calling dataSort(1, 'amazing') twice", function() {
    loadFixtures("cats_index.html");
    dataSort(1, 'amazing');
    cats.reverse();
    expect(cats[4]).toEqual({id: '5', url: 'https://s-media-cache-ak0.pinimg.com/originals/6b/45/5d/6b455d864ecce4270da03f9ff008736b.jpg', description: 'Pikachu! Meow?', zomg: '0', amazing: '5'});
  });

  it("displays cats with 'omg' votes in DESC order by calling sortVotes(0, 'omg') once", function() {
    loadFixtures("cats_index.html");
    sortVotes(0, 'zomg');    
    expect($('table tbody tr:first-child')).toContainText('sad kitty, poor kitty');
    expect($('table tbody tr:last-child')).toContainText('Pikachu! Meow?');
  });

  it("displays cats with 'omg' votes in ASC order votes by calling sortVotes(0, 'omg') twice", function() {
    loadFixtures("cats_index.html");
    sortVotes(0, 'zomg');
    sortVotes(0, 'zomg');     
    expect($('table tbody tr:first-child')).toContainText('Pikachu! Meow?');
    expect($('table tbody tr:last-child')).toContainText('sad kitty, poor kitty');
  });

  it("displays cats with 'amazing' votes in DESC order by calling sortVotes(1, 'amazing') once", function() {
    loadFixtures("cats_index.html");
    sortVotes(1, 'amazing');    
    expect($('table tbody tr:first-child')).toContainText('Pikachu! Meow?');
    expect($('table tbody tr:last-child')).toContainText('sad kitty, poor kitty');
  }); 

  it("displays cats with 'amazing' votes in ASC order votes by calling sortVotes(1, 'amazing') twice", function() {
    loadFixtures("cats_index.html");
    sortVotes(1, 'amazing');
    sortVotes(1, 'amazing');     
    expect($('table tbody tr:first-child')).toContainText('sad kitty, poor kitty');
    expect($('table tbody tr:last-child')).toContainText('Pikachu! Meow?');
  }); 

});