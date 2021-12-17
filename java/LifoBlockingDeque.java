import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.TimeUnit;

public class LifoBlockingDeque<E> extends LinkedBlockingDeque<E> 
{
  private static final long serialVersionUID = 82823459498873889L;
  
  @Override
  public boolean offer(E e) {
    // Override to put obj 
    return super.offerFirst(e);
  }
