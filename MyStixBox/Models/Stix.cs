namespace MyStixBox.Models
{
  public class Stix : RepoItem<int>
    {
        public string Name { get; set; }
        public string Company { get; set; }
        public string Binder { get; set; }
        public string Filler { get; set; }
        public string Wrapper { get; set; }
        public string Img { get; set; }
        public string MyReview { get; set; }
        public string CreatorId { get; set; }
    public Account Creator { get; set; }
  }
}