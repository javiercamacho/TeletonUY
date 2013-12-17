//
//  TeletonViewController.m
//  Teleton
//
//  Created by Javi on 10/24/13.
//  Copyright (c) 2013 Javi. All rights reserved.
//

#import "TeletonViewController.h"
#import "Config.h"

@interface TeletonViewController ()

@property (nonatomic, strong) NSString *text;
@property (nonatomic, weak) IBOutlet UITextView *textView;

@end

@implementation TeletonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Teletón";
    
    self.text = @"En 2003, Uruguay se incorporó a la obra Teletón para concretar la puesta en marcha de un Centro Nacional de Rehabilitación Infantil de nivel terciario único en el país que permitiera brindar diagnóstico y asistencia multidisciplinaria altamente especializada.\nEn ese año se realizó la primera maratón televisiva para recaudar fondos en nuestro país. El apoyo obtenido por todo el pueblo uruguayo, posibilitó que en 2005 se inaugurara el Centro Teletón en Montevideo y que en mayo de 2006 comenzaran las atenciones.\nApenas unos años después, en 2011, y gracias nuevamente al compromiso de todos los uruguayos, se inauguró el primer Centro en el interior del país en Fray Bentos.\nHoy, de cara a un nuevo año de trabajo, el desafío es mayor que nunca. Debemos pasar de largo los $ 92.738.425 alcanzados entre todos en la Teletón 2012, porque solo así podremos seguir atendiendo a los más de 2.800 niños y adolescentes que hoy son pacientes y asegurar que los niños nuevos que aspiran a ingresar a Teletón puedan hacerlo.\nEl 6 y 7 de diciembre te esperamos, porque sólo ¡contigo es posible!\n\nHasta donde llegue tu corazón, llega la Teletón.";
    
    self.textView.textAlignment = NSTextAlignmentJustified;
    self.textView.minimumZoomScale = 0.8;
    self.textView.font = [UIFont systemFontOfSize:16];

    if ([self.textView respondsToSelector:@selector(setTextContainerInset:)]) {
        [self.textView  setTextContainerInset:UIEdgeInsetsMake(8, 8, 8, 8)];
    }
    
    UIColor *selectionColor = [UIColor colorWithRed:217.0/255.5 green:224.0/255.0 blue:33.0/255.0 alpha:1.0];
    NSMutableAttributedString *attText = [[NSMutableAttributedString alloc] initWithString:self.text];
    
    NSRange range1 = [self.text rangeOfString:@"pasar de largo"];
    NSRange range2 = [self.text rangeOfString:@"$ 92.738.425"];
    NSRange range3 = [self.text rangeOfString:@"solo así podremos"];
    NSRange range4 = [self.text rangeOfString:@"Hasta donde llegue tu corazón, llega la Teletón."];
    
    NSMutableParagraphStyle *ps = [NSMutableParagraphStyle new];
    ps.alignment = NSTextAlignmentJustified;
    
    [attText addAttribute:NSForegroundColorAttributeName
                    value:[UIColor whiteColor]
                    range:NSMakeRange(0, self.text.length)];
    [attText addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:14]
                    range:NSMakeRange(0, self.text.length)];
    [attText addAttribute:NSParagraphStyleAttributeName
                    value:ps
                    range:NSMakeRange(0, self.text.length)];

    [attText addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:range1];
    [attText addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:range2];
    [attText addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:range3];
    [attText addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:range4];
    [attText addAttribute:NSForegroundColorAttributeName value:selectionColor range:range1];
    [attText addAttribute:NSForegroundColorAttributeName value:selectionColor range:range2];
    [attText addAttribute:NSForegroundColorAttributeName value:selectionColor range:range3];
    [attText addAttribute:NSForegroundColorAttributeName value:selectionColor range:range4];

    self.textView.attributedText = attText;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

@end
